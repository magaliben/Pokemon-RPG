//
//  Character.swift
//  Pokemon RPG
//
//  Created by Magali Bensalah on 08/06/2021.
//
class Character {
    let index: Int
    let name: String
    
    var lifePoint: Int {
        didSet {
            if lifePoint < 0 {
                lifePoint = 0
            }
        }
    }
    var weapon: Weapon
    
    init(index: Int, name: String, lifePoint: Int, weapon: Weapon) {
        self.index = index
        self.name = name
        self.lifePoint = lifePoint
        self.weapon = weapon
    }
    
    func treat() { // fonction qui permet de donner 15 points de soin au joueur qui a choisi de soigner un de ses personnages
        self.lifePoint += 15
    }
    
}
