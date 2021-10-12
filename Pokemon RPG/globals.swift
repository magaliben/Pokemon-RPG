//
//  globals.swift
//  Pokemon RPG
//
//  Created by Magali Bensalah on 28/07/2021.
//
// MARK: Internal properties

let randomRoundChestForPlayerOne = [1, 3, 5, 7, 9, 11].randomElement() // tour où le coffre apparaîtra pour le joueur 1
let randomRoundChestForPlayerTwo = [2, 4, 6, 8, 10, 12].randomElement() // tour où le coffre apparaîtra pour le joueur 2

let playerOneWeapons = [Weapon(damage: 40, name: "Gun"), // tableau des armes (nom + dommage) du joueur 1
                        Weapon(damage: 15, name: "Sword"),
                        Weapon(damage: 10, name: "Knife")]

let playerTwoWeapons = [Weapon(damage: 10, name: "Knife"), // tableau des armes (nom + dommage) du joueur 2
                        Weapon(damage: 15, name: "Hammer"),
                        Weapon(damage: 40, name: "Gun")]

var playerOne = Player(name: "Joueur 1", characters: [])
var playerTwo = Player(name: "Joueur 2", characters: [])
var namesOfCharacters: [String] = [] // tableau des noms des personnages afin d'éviter une redondance
