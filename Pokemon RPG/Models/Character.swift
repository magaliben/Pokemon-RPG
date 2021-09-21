//
//  Character.swift
//  Pokemon RPG
//
//  Created by Magali Bensalah on 08/06/2021.
//

import Foundation

class Character {
    let index: Int
    let name: String
    var weapon: Weapon
    var lifePoint: Int {
        didSet {
            if lifePoint < 0 {
                lifePoint = 0
            }
        }
    }
    
    init(index: Int, name: String, weapon: Weapon, lifePoint: Int) {
        self.index = index
        self.name = name
        self.weapon = weapon
        self.lifePoint = lifePoint
    }
    
    func treat() { // fonction qui permet de donner 15 points de soin au joueur qui à choisi de soigner un de ses personnages
        self.lifePoint += 15
    }
    
}
