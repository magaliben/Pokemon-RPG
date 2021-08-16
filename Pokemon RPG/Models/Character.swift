//
//  Character.swift
//  Pokemon RPG
//
//  Created by Magali Bensalah on 08/06/2021.
//

import Foundation

struct Character {
    let name: String
    var weapon: Weapon
    var lifePoint: Int
    
    mutating func treat() {
        self.lifePoint += 15
    }
    
}
