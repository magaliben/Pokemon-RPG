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
    private var isChestAlreadyProposed = false

    init(name: String, characters: [Character]) {
        self.name = name
        self.characters = characters
    }
    
    /// This function shows the characters of the current player.
    ///
    /// - Parameter subject: No parameter.
    /// - Returns: Void.
    func showTeam(gameEnd: Bool = false) { // fonction qui permet de faire apparaitre l'équipe créer
        print("L'équipe du \(self.name) est composée des personnages suivants : \n") // \n retour à la ligne //The  (self.name) team consists of the following characters:
        //faire un for sur la let characters
        for (index, character) in characters.enumerated() { // character objet Character / characters objet tableau Character
            if character.lifePoint > 0 || gameEnd {
                print("\(index+1). \(character.name) à \(character.lifePoint) points de vie et son arme est un \(character.weapon.name)") //health points and his weapon is
            } // ajouter le nom de l'arme dans le print de la fornction showTeam
        }
        print("")
    }
    
    /// This function gates the name of each characters of the current player and creates them.
    ///
    /// - Parameter weapons: array of weapons.
    /// - Returns: Void.-*
    
    func createTeam(with weapons: [Weapon]) { // fonction qui permet de crée l'équipe composé des 3 personnages
        var index = 0
        var name = ""
        
        print("\(self.name) veuillez créer votre équipe")
        
        repeat {
            print("Veuillez donner un nom à votre personnage \(index+1)")
            if let choiceName = readLine() {
                
                name = choiceName
                
                if !choiceName.isEmpty, !namesOfCharacters.contains(name) { // Faire en sort qu'il ne soit pas possible d'avoir 2 personnages ayant le meme nom (creation d'un tableau namesofcharacter dans global)
                    self.characters.append(Character(index: index, name: name, weapon: weapons[index], lifePoint: 100))
                    if index == 2 { print("\n") }
                    namesOfCharacters.append(name)
                    index += 1
                } else {
                    if namesOfCharacters.contains(name) {
                        print("Le nom de ce personne est déjà utilisé, merci d'en choisir un autre")
                    } else {
                        print("Merci de renseigner un nom correct pour votre personnage")
                    }
                }
            }
        } while name == "" || index <= 2 // le nom du personnage ne doit pas etre vide et ne pas depasser 3 personnages
    }
    
    func treatCharacter(finished: () -> Void) { // fonction pour soigner
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
    
    func hasTeamAlive() -> Bool { // fonction qui permet d'incrementer les points de vie au personnages
        var teamHealth = 0
        for character in self.characters {
            teamHealth += character.lifePoint
        }
        return teamHealth > 0 // permet de faire disparaitre le personnage lorsqu'il n'a plus de point de vie
    }
    
    // Ajouter l'affichage du coffre si le coffre est accepter changer l'arme du personnage
    // Check if player has already had a chest and if no -> then propose one randomly
    func randomWeaponMayAppear(for character: Character) {
        if !self.isChestAlreadyProposed {
            if Game.turnNumber == randomRoundChestForPlayerOne || Game.turnNumber == randomRoundChestForPlayerTwo {
                print("\n🎁 Voici une arme secrète plus ou moins puissante que celle de votre personnage.\n Souhaitez-vous remplacer celle de votre personnage par celle-ci ?\n")
                print("1. Oui\n2. Non")
                
                if let choice = readLine() {
                    if let intChoice = Int(choice) {
                        let index = intChoice - 1
                        if intChoice > 0 && intChoice <= 2 {
                            if index == 0 {
                                print("\(character.name) a échangé son arme [\(character.weapon.name)] infligeant \(character.weapon.damage) points de dommage à son adversaire.")
                                let randomWeapon = Chest.randomWeapon()
                                character.weapon = randomWeapon
                                print("Il est maintenant équipé de l'arme [\(character.weapon.name)] infligeant \(character.weapon.damage) points de dommage à son adversaire.")
                            } else {
                                print("Vous avez refusé le \(Chest.randomWeapon().name).")
                            }
                            
                            do {
                                sleep(1)
                            }
                            game.characterToAttack(character.index, self)
                        } else {
                            print("\n❌ Veuillez indiquer un nombre compris dans la liste proposée.\n\n")
                            self.randomWeaponMayAppear(for: character)
                        }
                    } else {
                        print("\n❌ Veuillez indiquer un nombre.\n\n")
                        self.randomWeaponMayAppear(for: character)
                    }
                }
            } else {
                game.characterToAttack(character.index, self)
            }
        } else {
            game.characterToAttack(character.index, self)
        }
    }
}
