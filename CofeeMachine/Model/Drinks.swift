//
//  Drinks.swift
//  CofeeMachine
//
//  Created by Andrian Kryk on 20.01.2020.
//  Copyright © 2020 Andrian Kryk. All rights reserved.
//

import UIKit

class Drinks: NSObject {
  let name: String
  let water: Int
  let beans: Int
  let milk: Int
  let trash: Int
  //let portion: Int - TBD later
  
  init(name: String, water: Int, beans: Int, milk: Int, trash: Int) {
    self.name = name
    self.water = water
    self.beans = beans
    self.milk = milk
    self.trash = trash
  }
  
  static func capuchinoDrink() -> Drinks {
    return Drinks(name: "Capuchino", water: 100, beans: 100, milk: 50, trash: 10)
  }
  
  static func espresso() -> Drinks {
    return Drinks(name: "Espresso", water: 50, beans: 200, milk: 0, trash: 20)
  }
  
}
