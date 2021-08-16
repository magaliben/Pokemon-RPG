//
//  Game.swift
//  Pokemon RPG
//
//  Created by Magali Bensalah on 08/06/2021.
//

import Foundation

struct Game {
    
    
    var playerTurn = PlayerTurn.playerOne
    var currentPlayer = "Joueur 1"
       
    mutating func start() {
        playerOne.createTeam(with: playerOneWeapons)
        playerTwo.createTeam(with: playerTwoWeapons)
        print("Appuyez sur la touche entrée pour commencer la partie")
        if let _ = readLine() {
            self.startBattle()
        }
    }
    
    mutating func startBattle() {
        repeat {
            print("""
        \(self.currentPlayer) souhaitez-vous
        1 : attaquer un personnage adverse ?
        2 : soigner un personnage de votre équipe ?
        """)
            
            var choice = ""
            
            repeat {
                if let actionChoice = readLine(), !actionChoice.isEmpty, actionChoice == "1" || actionChoice == "2" {
                    choice = actionChoice
                    if actionChoice == "1"  {
                        print("Vous avez choisi d'attaquer un personnage adverse")
                        print("Veuillez choisir un personnage de votre équipe pour attaquer votre adversaire")
                        self.showPlayerTeam()
                    } else if actionChoice == "2" {
                        print("Vous avez choisi de soigner un personnage de votre équipe")
                        print("Veuillez choisir un personnage de votre équipe afin de le soigner")
                        self.showPlayerTeam()
                        if self.currentPlayer == "Joueur 1" {
                            playerOne.treatCharacter() {
                                self.switchPlayer()
                            }
                        } else {
                            playerTwo.treatCharacter() {
                                self.switchPlayer()
                            }
                        }
                    }
                    //appeler la fonction permettant de soigner ou la fonction d'attaquer
                    
                } else {
                    print("""
        Veuillez faire un choix entre
        1 : attaquer un personnage adverse
        2 : soigner un personnage de votre équipe
        """)
                }
            } while choice != "1" || choice != "2"
        } while playerOne.hasTeamAlive() && playerTwo.hasTeamAlive()
    }
    
    func showPlayerTeam() {
        if self.currentPlayer == "Joueur 1" {
            playerOne.showTeam()
        } else {
            playerTwo.showTeam()
        }
    }
    
    func attack() {
        
    }
    
    func showWinner() {
        
    }
    
    mutating func switchPlayer(){
        if self.currentPlayer == "Joueur 1" {
            self.currentPlayer  = "Joueur 2"
        } else {
            self.currentPlayer = "Joueur 1"
        }
        
    }
}
