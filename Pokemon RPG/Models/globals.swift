//
//  globals.swift
//  Pokemon RPG
//
//  Created by Magali Bensalah on 28/07/2021.
//
var playerOne = Player(name: "Joueur 1", characters: [])
var playerTwo = Player(name: "Joueur 2", characters: [])

let roundsForPlayerOne = [1, 3, 5, 7, 9, 11] // tour de jeu du joueur 1
let roundsForPlayerTwo = [2, 4, 6, 8, 10, 12] // tour de jeu du joueur 2
let randomRoundChestForPlayerOne = roundsForPlayerOne.randomElement() // tour de jeu du joueur 1 pour le choix aléatoire du coffre
let randomRoundChestForPlayerTwo = roundsForPlayerTwo.randomElement() // tour de jeu du joueur 2 pour le choix aléatoire du coffre

let playerOneWeapons: [Weapon] = [Weapon(name: "Gun", damage: 40), // tableau des armes (nom + dommage) du joueur 1
                                  Weapon(name: "Sword", damage: 15),
                                  Weapon(name: "Knife", damage: 10)]

let playerTwoWeapons: [Weapon] = [Weapon(name: "Knife", damage: 10), // tableau des armes (nom + dommage) du joueur 2
                                  Weapon(name: "Hammer", damage: 15),
                                  Weapon(name: "Gun", damage: 40)]

var namesOfCharacters: [String] = [] // tableau des noms des personnages
