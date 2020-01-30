//
//  CofeMachine.swift
//  CofeeMachine
//
//  Created by Andrian Kryk on 10.01.2020.
//  Copyright © 2020 Andrian Kryk. All rights reserved.
//

import UIKit

class CofeMachine: NSObject {
  
  //capacity of tanks
  let waterTankCapasity = 2000
  let milkTankCapasity = 1500
  let beansTankCapasity = 2500
  let trashBinCapasity = 2500
  
  //tankState
  var waterTankLevel = 500
  var milkTankLevel = 750
  var beansTankLevel = 350
  var trashBinLevel = 0
  
  //portions
  var waterPortion = 150
  var milkPortion = 150
  var beansPortion = 150
  var trashPortion = 0
  
  //check level of tanks and trash bean
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
  
  //actions
  func initRecipe(drink: Drink) -> String {
    var labelText: String = ""
    if isTrashBinIsEmpty(drink: drink) {
      if isEnoughIngridientsForProduct(drink: drink) {
        waterTankLevel -= drink.water
        beansTankLevel -= drink.beans
        milkTankLevel -= drink.milk
        trashBinLevel += drink.trash
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
          labelText = "\(waterPortion) Water added"
        } else {
          labelText = "Water tank is full"
        }
      case .milk:
        if milkTankCapasity >= (milkTankLevel + milkPortion) {
          milkTankLevel += milkPortion
          labelText = "\(milkPortion) Milk added"
        } else {
          labelText = "Milk tank is full"
        }
      case .beans:
        if beansTankCapasity >= (beansTankLevel + beansPortion) {
          beansTankLevel += beansPortion
          labelText = "\(beansPortion) Beans added"
        } else {
          labelText = "Beans tank is full"
        }
      case .trash:
        trashBinLevel = 0
        labelText = "Bin Cleaned"
      }
    return labelText
  }
  
  
 
}






