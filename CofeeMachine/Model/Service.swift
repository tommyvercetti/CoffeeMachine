//
//  Service.swift
//  CofeeMachine
//
//  Created by Andrian Kryk on 24.01.2020.
//  Copyright © 2020 Andrian Kryk. All rights reserved.
//

import UIKit

class Service: NSObject {
  let name: String
  let water: Int
  let beans: Int
  let milk: Int
  let trash: Int
  
  init(name: String, water: Int, beans: Int, milk: Int, trash: Int) {
    self.name = name
    self.water = water
    self.beans = beans
    self.milk = milk
    self.trash = trash
  }
  
  static func addMilk() -> Service {
    return Service(name: "Milk", water: 0, beans: 0, milk: 500, trash: 0)
  }
  
  static func addWater() -> Service {
    return Service(name: "Water", water: 500, beans: 0, milk: 0, trash: 0)
  }
  
  static func addBeans() -> Service {
    return Service(name: "Beans", water: 0, beans: 500, milk: 0, trash: 0)
  }
  
  static func cleanTrashBin() -> Service {
    return Service(name: "Trash", water: 0, beans: 0, milk: 0, trash: 0)
  }
}
