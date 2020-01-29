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
  
//  func isTankIsFull(service: IngridientType) -> Bool {
//    var result = false
//    if waterTankCapasity < (waterTankLevel + IngridientType.water.quantity) ||
//      milkTankCapasity < (milkTankLevel + IngridientType.milk.quantity) ||
//      beansTankCapasity < (beansTankLevel + IngridientType.beans.quantity){
//      result = true
//    }
//    return result
//  }
  
  
  func isTankIsFull() -> Bool {
    var result = false
    if waterTankCapasity < (waterTankLevel + waterPortion) ||
      milkTankCapasity < (milkTankLevel + milkPortion) ||
      beansTankCapasity < (beansTankLevel + beansPortion){
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
//  func addProduct(service: Service) -> String {
//    var labelText: String = ""
//    if !isTankIsFull(service: service) {
//      waterTankLevel += service.water
//      milkTankLevel  += service.milk
//      beansTankLevel += service.beans
//      labelText = "\(service.name) added"
//    } else {
//      labelText = "\(service.name) tank is full"
//    }
//    return labelText
//  }
  
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
  
//  func cleanTrashBin(service: Service) -> String {
//    var labelText: String = ""
//    trashBinLevel = service.trash
//    labelText = "bin is empty"
//    return labelText
//  }
  
  func makeService(type: IngridientType) -> String{
    var labelText: String = ""
    if !isTankIsFull() {
      switch type {
      case .water:
        waterTankLevel += waterPortion
        labelText = "\(waterPortion) Water added"
      case .milk:
        milkTankLevel += milkPortion
        labelText = "\(milkPortion) Milk added"
      case .beans:
        beansTankLevel += beansPortion
        labelText = "\(beansPortion) Beans added"
      case .trash:
        trashBinLevel = 0
        labelText = "Bin Cleaned"
      }
    }
    return labelText
  }
  
  
  
  
//  func addProductEnum(service: IngridientType) -> String {
//    var labelText: String = ""
//    if !isTankIsFull(service: service) {
//
//      waterTankLevel += IngridientType.water.quantity
//      labelText = "\(IngridientType.water.ingridient) added"
//
//      milkTankLevel  += IngridientType.milk.quantity
//      labelText = "\(IngridientType.milk.ingridient) added"
//
//      beansTankLevel += IngridientType.beans.quantity
//      labelText = "\(IngridientType.beans.ingridient) added"
//
//    }else {
//      labelText = "\(IngridientType.water.ingridient) tank is full"
//      labelText = "\(IngridientType.milk.ingridient) tank is full"
//      labelText = "\(IngridientType.beans.ingridient) tank is full"
//    }
//    return labelText
//  }
  
}






