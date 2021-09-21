//
//  Chest.swift
//  Pokemon RPG
//
//  Created by Magali Bensalah on 21/06/2021.
//

import Foundation

class Chest {
    static let randomWeapons = [Weapon(name: "Punch 👊🏻", damage: 5), // tableau des armes (nom + dommage)qui seront proposer dans le coffre aléatoirement
                                Weapon(name: "Fork 🍴", damage: 10),
                                Weapon(name: "Bomb 💣", damage: 95)]
    
    static func randomWeapon() -> Weapon { // fonction qui permet de donner aléatoirement une arme
        let randomIndex = arc4random_uniform(3)
        return randomWeapons[Int(randomIndex)]
    }
}
