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
  
  //check level of tanks and trash bean
  func isEnoughIngridientsForProduct(drink: Drinks) -> Bool {
    var result = false
    if waterTankLevel >= drink.water && milkTankLevel >= drink.milk && beansTankLevel >= drink.beans{
      result = true
    }
    return result
  }
  
  func isTankIsFull(service: Service) -> Bool {
    var result = false
    if waterTankCapasity < (waterTankLevel + service.water) ||
      milkTankCapasity < (milkTankLevel + service.milk) ||
      beansTankCapasity < (beansTankLevel + service.beans){
      result = true
    }
    return result
  }
  
  func isTrashBinIsEmpty(drink: Drinks) -> Bool {
    var result = false
    if trashBinCapasity > (trashBinLevel + drink.trash) {
      result = true
    }
    return result
  }
  
  //actions
  func addProduct(service: Service) -> String {
    var labelText: String = ""
    if !isTankIsFull(service: service) {
      waterTankLevel += service.water
      milkTankLevel  += service.milk
      beansTankLevel += service.beans
      labelText = "\(service.name) added"
    } else {
      labelText = "tank is full"
    }
    return labelText
  }
  
  func initRecipe(drink: Drinks) -> String {
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
  
  func cleanTrashBin(service: Service) -> String {
    var labelText: String = ""
    trashBinLevel = service.trash
    labelText = "bin is empty"
    return labelText
  }
}






