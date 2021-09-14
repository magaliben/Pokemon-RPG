//
//  Player.swift
//  Pokemon RPG
//
//  Created by Magali Bensalah on 08/06/2021.
//

import Foundation

class Player {
    let name: String
    var characters: [Character]
    init(name: String,characters: [Character]) {
        self.name = name
        self.characters = characters
    }
    
    /// This function shows the characters of the current player.
    ///
    /// - Parameter subject: No parameter.
    /// - Returns: Void.
    func showTeam(gameEnd: Bool = false) {
        print("L'équipe du \(self.name) est composée des personnages suivants : \n") // \n retour à la ligne //The  (self.name) team consists of the following characters:
        //faire un for sur la let characters
        for (index, character) in characters.enumerated() { // character objet Character / characters objet tableau Character
            if character.lifePoint > 0 || gameEnd {
                print("\(index+1). \(character.name) à \(character.lifePoint) points de vie et son arme est un \(character.weapon.name)") //health points and his weapon is
            }
        }
        print("")
    }
    
    /// This function gates the name of each characters of the current player and creates them.
    ///
    /// - Parameter weapons: array of weapons.
    /// - Returns: Void.-*
    
    func createTeam(with weapons: [Weapon]) {
        var index = 0
        var name = ""
        
        print("\(self.name) veuillez créer votre équipe")
        
        repeat {
            repeat {
                print("Veuillez donner un nom à votre personnage \(index+1)")
                if let choiceName = readLine() {
                    
                    if index == 3 { print("\n") }

                    name = choiceName
                    
                    if  !choiceName.isEmpty, !namesOfCharacters.contains(name) {
                        self.characters.append(Character(name: name, weapon: weapons[index], lifePoint: 100))
                        index += 1
                        namesOfCharacters.append(name)
                    } else {
                        if namesOfCharacters.contains(name) {
                            print("Le nom de ce personne est déjà utilisé, merci d'en choisir un autre")
                        } else {
                            print("Merci de renseigner un nom correct pour votre personnage")
                        }
                    }
                }
            } while name.isEmpty || namesOfCharacters.contains(name)
        } while index < 3
    }
    
    func treatCharacter(finished: () -> Void) {
        var choice = ""
        repeat {
            if let actionChoice = readLine(), !actionChoice.isEmpty, actionChoice != "0", Int(actionChoice) ?? 99 <= self.characters.count {
                choice = actionChoice
                if let choiceInt = Int(choice) {
                    let index = choiceInt - 1
                    self.characters[index].treat()
                    finished()
                    // print(self.characters[index].lifePoint) nombre de point de vie apres le soin
                }
            } else {
                choice = ""
                print("Merci de renseigner un numéro correct")
            }
        } while choice.isEmpty
    }
    
    func hasTeamAlive() -> Bool {
        var teamHealth = 0
        for character in self.characters {
            teamHealth += character.lifePoint
        }
        return teamHealth > 0
    }
    
}

