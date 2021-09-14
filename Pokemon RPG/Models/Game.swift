//
//  Game.swift
//  Pokemon RPG
//
//  Created by Magali Bensalah on 08/06/2021.
//

import Foundation

struct Game {
    
    static var turnNurber = 1
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
            
            var isPlayerSwitched = false
            
            repeat {
                if let actionChoice = readLine(), !actionChoice.isEmpty, actionChoice == "1" || actionChoice == "2" {
                    if actionChoice == "1"  {
                        
                        self.attack()
                    } else {
                        print("Vous avez choisi de soigner un personnage de votre équipe")
                        print("Veuillez choisir un personnage de votre équipe afin de le soigner")
                        self.showPlayerTeam()
                        if self.currentPlayer == "Joueur 1" {
                            playerOne.treatCharacter() {
                                self.switchPlayer()
                                isPlayerSwitched = true
                            }
                        } else {
                            playerTwo.treatCharacter() {
                                self.switchPlayer()
                                isPlayerSwitched = true
                            }
                        }
                    }
                    //appeler la fonction permettant de soigner ou la fonction d'attaquer
                } else {
                    print("""
        \(self.currentPlayer) Veuillez faire un choix entre
        1 : attaquer un personnage adverse
        2 : soigner un personnage de votre équipe
        """)
                }
            } while !isPlayerSwitched
        } while playerOne.hasTeamAlive() && playerTwo.hasTeamAlive()
    }
    
    func showPlayerTeam() {
        if self.currentPlayer == "Joueur 1" {
            playerOne.showTeam()
        } else {
            playerTwo.showTeam()
        }
    }
    
    mutating func attack() {
        
        print("Vous avez choisi d'attaquer un personnage adverse")
        print("Veuillez choisir un personnage de votre équipe pour attaquer votre adversaire")
        self.showPlayerTeam()
        var choice = ""
        repeat {
            let playerWhoAttacks = self.currentPlayer == "Joueur 1" ? playerOne : playerTwo
            repeat {
                if let characterWhoAttacks = readLine(), !characterWhoAttacks.isEmpty, characterWhoAttacks > "0", let characterWhoAttacksNumber = Int(characterWhoAttacks), characterWhoAttacksNumber <= playerWhoAttacks.characters.count, playerWhoAttacks.characters[characterWhoAttacksNumber - 1].lifePoint > 0 {
                    choice = characterWhoAttacks
                    
                   // print("Surprise voici un coffre \(Chest.randomWeapon() -> Weapon)")
    
                    print("Veuillez choisir un personnage de l'équipe adverse à attaquer")
                    
                    if self.currentPlayer == "Joueur 1" {
                        playerTwo.showTeam()
                    } else {
                        playerOne.showTeam()
                    }
                    
                    let playerWhoIsAttacked = self.currentPlayer == "Joueur 1" ? playerTwo : playerOne
                    if let characterToAttack = readLine(), !characterToAttack.isEmpty, characterToAttack > "0", Int(characterToAttack) ?? 99 <= playerWhoIsAttacked.characters.count {
                        if let indexOfCharacterToAttack = Int(characterToAttack) {
                            if let indexOfCharacterWhoAttacks = Int(characterWhoAttacks) {
                                playerWhoIsAttacked.characters[indexOfCharacterToAttack - 1].lifePoint -= playerWhoAttacks.characters[indexOfCharacterWhoAttacks - 1].weapon.damage
                                print("\(self.currentPlayer) vient d'attaquer")
                                
                            } else {
                                choice = ""
                                print("Merci de renseigner un numéro correct")
                            }
                        } else {
                            choice = ""
                            print("Merci de renseigner un numéro correct")
                        }
                    } else {
                        choice = ""
                        print("Merci de renseigner un numéro correct")
                    }
                } else {
                    choice = ""
                    print("Merci de renseigner un numéro correct")
                }
            } while choice.isEmpty
        } while choice.isEmpty
        
        if !playerOne.hasTeamAlive() || !playerTwo.hasTeamAlive() {
            self.showWinner()
        } else {
            self.switchPlayer()
            print("\(self.currentPlayer) Appuyer sur entrer pour jouer")
        }
    }
    
    mutating func showWinner() {
        print("\(currentPlayer) à gagné la partie")
        /*statistiques de jeu : le nombre de tours, et la liste des personnages des deux equipes avec leurs propriétés ( points de vie, nom et arme)*/
        
        playerOne.showTeam(gameEnd: true)
        playerTwo.showTeam(gameEnd: true)
        print("Voici le nombre de tours effectués par les joueurs: \(Game.turnNurber)")
    }
    
    mutating func switchPlayer() {
        if self.currentPlayer == "Joueur 1" {
            self.currentPlayer  = "Joueur 2"
        } else {
            self.currentPlayer = "Joueur 1"
        }
        Game.turnNurber += 1
    }
}
// ajouter le nom de l'arme dans le print de la fornction showTeam
// Faire en sort qu'il ne soit pas possible d'avoir 2 personnages ayant le meme nom
// Ajouter l'affichage du coffre si le coffre est accepter changer l'arme du personnage

