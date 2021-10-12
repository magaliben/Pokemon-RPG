//
//  Chest.swift
//  Pokemon RPG
//
//  Created by Magali Bensalah on 21/06/2021.
//

import Foundation // framework

class Chest {
    static private let randomWeapons = [Weapon(damage: 5, name: "Punch 👊🏻"), // tableau des armes (nom + dommage) qui seront proposées dans le coffre aléatoirement
                                        Weapon(damage: 10, name: "Fork 🍴"),
                                        Weapon(damage: 95, name: "Bomb 💣")]
    
    static func randomWeapon() -> Weapon { // fonction qui permet de donner aléatoirement une arme
        let randomIndex = Int(arc4random_uniform(3)) // convertion Uint32(arc4random_uniform) en Int
        return randomWeapons[randomIndex]
    }
}


