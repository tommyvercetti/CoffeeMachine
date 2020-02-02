//
//  CofeMachine.swift
//  CofeeMachine
//
//  Created by Andrian Kryk on 10.01.2020.
//  Copyright © 2020 Andrian Kryk. All rights reserved.
//

import UIKit

class CofeMachine: NSObject {
  
  // MARK: - capacity of tanks
  let waterTankCapasity = 2000
  let milkTankCapasity = 1500
  let beansTankCapasity = 2500
  let trashBinCapasity = 2500
  
  // MARK: - tankState
  var waterTankLevel = UserDefaults.standard.integer(forKey: Constants.storedWaterLevel)
  var milkTankLevel = UserDefaults.standard.integer(forKey: Constants.storedMilkLevel)
  var beansTankLevel = UserDefaults.standard.integer(forKey: Constants.storedBeansLevel)
  var trashBinLevel = UserDefaults.standard.integer(forKey: Constants.storedTrashLevel)
  
  
  // MARK: - portions
  var waterPortion = 150
  var milkPortion = 150
  var beansPortion = 150
  var trashPortion = 0
  
  
  // MARK: - check level of tanks and trash bean
  func isEnoughIngridientsForProduct(drink: Drink) -> Bool {
    var result = false
    if waterTankLevel >= drink.water && milkTankLevel >= drink.milk && beansTankLevel >= drink.beans{
      result = true
    }
    return result
  }
  
  func isTrashBinIsEmpty(drink: Drink) -> Bool {
    var result = false
    if trashBinCapasity > (trashBinLevel + drink.trash) {
      result = true
    }
    return result
  }
  
  
  // MARK: - actions
  func initRecipe(drink: Drink) -> String {
    
    
    var labelText: String = ""
    if isTrashBinIsEmpty(drink: drink) {
      if isEnoughIngridientsForProduct(drink: drink) {
        waterTankLevel -= drink.water
        UserDefaults.standard.set(waterTankLevel, forKey: Constants.storedWaterLevel)
        milkTankLevel -= drink.milk
        UserDefaults.standard.set(milkTankLevel, forKey: Constants.storedMilkLevel)
        beansTankLevel -= drink.beans
        UserDefaults.standard.set(beansTankLevel, forKey: Constants.storedBeansLevel)
        trashBinLevel += drink.trash
        UserDefaults.standard.set(trashBinLevel, forKey: Constants.storedTrashLevel)

        labelText = "\(drink.name) is ready \u{2615}"
        return labelText
      }else {
        labelText = "not enought ingridients"
      }
    }  else {
      labelText = "Clean trash bin"
    }
    return labelText
  }
 
  func makeService(type: IngridientType) -> String {
    var labelText: String = ""
      switch type {
      case .water:
        if waterTankCapasity >= (waterTankLevel + waterPortion) {
          waterTankLevel += waterPortion
          UserDefaults.standard.set(waterTankLevel, forKey: Constants.storedWaterLevel)
          labelText = "\(waterPortion) Water added"
        } else {
          labelText = "Water tank is full"
        }
      case .milk:
        if milkTankCapasity >= (milkTankLevel + milkPortion) {
          milkTankLevel += milkPortion
          UserDefaults.standard.set(milkTankLevel, forKey: Constants.storedMilkLevel)
          labelText = "\(milkPortion) Milk added"
        } else {
          labelText = "Milk tank is full"
        }
      case .beans:
        if beansTankCapasity >= (beansTankLevel + beansPortion) {
          beansTankLevel += beansPortion
          UserDefaults.standard.set(beansTankLevel, forKey: Constants.storedBeansLevel)
          labelText = "\(beansPortion) Beans added"
        } else {
          labelText = "Beans tank is full"
        }
      case .trash:
        trashBinLevel = 0
        UserDefaults.standard.set(trashBinLevel, forKey: Constants.storedTrashLevel)
        labelText = "Bin Cleaned"
      }
    return labelText
  }
}






