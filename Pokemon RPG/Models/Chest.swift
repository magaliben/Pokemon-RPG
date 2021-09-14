//
//  Chest.swift
//  Pokemon RPG
//
//  Created by Magali Bensalah on 21/06/2021.
//

import Foundation

 struct Chest {
    let randomWeapons = [Weapon(name: "Punch 👊🏻", damage: 5),
                         Weapon(name: "Fork 🍴", damage: 10),
                         Weapon(name: "Bomb 💣", damage: 95)]
    
  mutating func randomWeapon() -> Weapon {
        let randomIndex = arc4random_uniform(3)
        return randomWeapons[Int(randomIndex)]
    }
}
