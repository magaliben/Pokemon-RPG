//
//  globals.swift
//  Pokemon RPG
//
//  Created by Magali Bensalah on 28/07/2021.
//
var playerOne = Player(name: "Joueur 1", characters: [])
var playerTwo = Player(name: "Joueur 2", characters: [])

let playerOneWeapons: [Weapon] = [Weapon(name: "Gun", damage: 40),
                                  Weapon(name: "Sword", damage: 15),
                                  Weapon(name: "Knife", damage: 10)]

let playerTwoWeapons: [Weapon] = [Weapon(name: "Knife", damage: 10),
                                  Weapon(name: "Hammer", damage: 15),
                                  Weapon(name: "Gun", damage: 40)]
