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
  let waterTankCapasity: Int
  let milkTankCapasity: Int
  let beansTankCapasity: Int
  let trashBinCapasity: Int
  
  
  // MARK: - tankState
  private var newValueOfTankLevel: Int
  
  private var waterTankLevel: Int
  private var milkTankLevel: Int
  private var beansTankLevel: Int
  private var trashBinLevel: Int
  
  
  // MARK: - portions
  var waterPortion: Int
  var milkPortion: Int
  var beansPortion: Int
  var trashPortion: Int
  
  // MARK: - init
  init (newValueOfTankLevel: Int, waterTankCapasity: Int, milkTankCapasity: Int, beansTankCapasity: Int, trashBinCapasity: Int, waterTankLevel: Int, milkTankLevel: Int, beansTankLevel: Int, trashBinLevel: Int, waterPortion: Int, milkPortion: Int, beansPortion: Int, trashPortion: Int) {
    
    self.newValueOfTankLevel = newValueOfTankLevel
    
    self.waterTankCapasity = waterTankCapasity
    self.milkTankCapasity = milkTankCapasity
    self.beansTankCapasity = beansTankCapasity
    self.trashBinCapasity = trashBinCapasity
    
    self.waterTankLevel =  waterTankLevel
    self.milkTankLevel = milkTankLevel
    self.beansTankLevel = beansTankLevel
    self.trashBinLevel = trashBinLevel
    
    self.waterPortion = waterPortion
    self.milkPortion = milkPortion
    self.beansPortion = beansPortion
    self.trashPortion = trashPortion
    
  }
  
  
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
  
  
  // MARK: - Product Actions
  func makeDrink(drink: Drink) -> String {
    var labelText: String = ""
    if isTrashBinIsEmpty(drink: drink) {
      if isEnoughIngridientsForProduct(drink: drink) {
        waterTankLevel -= drink.water
        waterTankLevel = saveUserDefaults(productLevel: waterTankLevel, key: Constants.storedWaterLevel)
        milkTankLevel -= drink.milk
        milkTankLevel = saveUserDefaults(productLevel: milkTankLevel, key: Constants.storedMilkLevel)
        beansTankLevel -= drink.beans
        beansTankLevel = saveUserDefaults(productLevel: beansTankLevel, key: Constants.storedBeansLevel)
        trashBinLevel += drink.trash
        trashBinLevel = saveUserDefaults(productLevel: trashBinLevel, key: Constants.storedTrashLevel)
        labelText = "\(drink.name) is ready \u{2615}"
        increaseCupsCount()
        return labelText
      } else {
        labelText = "not enought ingridients"
      }
    } else {
      labelText = "Clean trash bin"
    }
    return labelText
  }
  
  
  // MARK: - Service Actions
  func initService(tankCapasity: Int, tankLevel: Int, portion: Int, ingridientType: IngridientType) -> (String) {
    var labelText: String = ""
    if ingridientType == IngridientType.trash {//case for trash bin
      newValueOfTankLevel = 0
      labelText = "Bin Cleaned"
      return (labelText)
    } else {
      if tankCapasity >= (tankLevel + portion) {
        newValueOfTankLevel = (tankLevel + portion)
        labelText = "\(portion) \(ingridientType) added"
        return (labelText)
      } else {
        labelText = "Water tank is full"
        return (labelText)
      }
    }
  }
  
  func makeService(type: IngridientType) -> (String) {
    switch type {
    case .water:
      newValueOfTankLevel = restoreUserDefaults(key: Constants.storedWaterLevel)
      let labelText = initService(tankCapasity: waterTankCapasity, tankLevel: waterTankLevel, portion: waterPortion, ingridientType: .water)
      waterTankLevel = saveUserDefaults(productLevel: newValueOfTankLevel, key: Constants.storedWaterLevel)
      return labelText
      
    case .milk:
      newValueOfTankLevel = restoreUserDefaults(key: Constants.storedMilkLevel)
      let labelText = initService(tankCapasity: milkTankCapasity, tankLevel: milkTankLevel, portion: milkPortion, ingridientType: .milk)
      milkTankLevel = saveUserDefaults(productLevel: newValueOfTankLevel, key: Constants.storedMilkLevel)
      return labelText
      
    case .beans:
      newValueOfTankLevel = restoreUserDefaults(key: Constants.storedBeansLevel)
      let labelText = initService(tankCapasity: beansTankCapasity, tankLevel: beansTankLevel, portion: beansPortion, ingridientType: .beans)
      beansTankLevel = saveUserDefaults(productLevel: newValueOfTankLevel, key: Constants.storedBeansLevel)
      return labelText
      
    case .trash:
      newValueOfTankLevel = restoreUserDefaults(key: Constants.storedTrashLevel)
      let labelText = initService(tankCapasity: waterTankCapasity, tankLevel: waterTankLevel, portion: waterPortion, ingridientType: .trash)
      trashBinLevel = saveUserDefaults(productLevel: newValueOfTankLevel, key: Constants.storedTrashLevel)
      return labelText
      
    }
  }
  
  
  // MARK: - User Defaults
  func saveUserDefaults(productLevel: Int, key: String) -> Int {
    UserDefaults.standard.set(productLevel, forKey: key)
    return restoreUserDefaults(key: key)
  }
  
  func restoreUserDefaults(key: String) -> Int {
    return UserDefaults.standard.integer(forKey: key)
  }
  
  func increaseCupsCount() {
    let value = UserDefaults.standard.integer(forKey: Constants.cupCount) + 1
    UserDefaults.standard.setValue(value, forKey: Constants.cupCount)
//    return value
  }
  
  func increaseRunCount() -> Int {
    let value = UserDefaults.standard.integer(forKey: Constants.runCount) + 1
    UserDefaults.standard.setValue(value, forKey: Constants.runCount)
    return value
  }
  
}
