//
//  ViewController.swift
//  CofeeMachine
//
//  Created by Andrian Kryk on 09.01.2020.
//  Copyright © 2020 Andrian Kryk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var runCounterLabel: UILabel!{
    didSet{
      runCounterLabel.text = "Run number \(increaseRunCount())"
      
    }
  }
  
  @IBOutlet weak var ingridientsMonitorLabel: UILabel!{
    didSet{
      showLevelOfIngridients()
    }
  }
  
  
  // MARK: - Init
  let firstMachine = CofeMachine(newValueOfTankLevel: 0,
                                 waterTankCapasity: 2000, milkTankCapasity: 1500, beansTankCapasity: 2500, trashBinCapasity: 2500,
                                 waterTankLevel: UserDefaults.standard.integer(forKey: Constants.storedWaterLevel),
                                 milkTankLevel: UserDefaults.standard.integer(forKey: Constants.storedMilkLevel),
                                 beansTankLevel: UserDefaults.standard.integer(forKey: Constants.storedBeansLevel),
                                 trashBinLevel: UserDefaults.standard.integer(forKey: Constants.storedTrashLevel),
                                 waterPortion: 150, milkPortion: 150, beansPortion: 150, trashPortion: 0)
  
  
  
  // MARK: - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
  }
  
  
  //MARK: - Monitor
  func showLevelOfIngridients() {
    ingridientsMonitorLabel.text =
    """
    Water tank - \(firstMachine.restoreUserDefaults(key: "waterLevel"))
    Milk tank - \(firstMachine.restoreUserDefaults(key: "milkLevel"))
    Beans tank - \(firstMachine.restoreUserDefaults(key: "beansLevel"))
    Trash bin - \(firstMachine.restoreUserDefaults(key: "trashLevel"))
    """
    ingridientsMonitorLabel.numberOfLines = 4
  }
  
  @IBAction func showLevelOfIngridientsButton() {
    showLevelOfIngridients()
  }
  
  
  
  // MARK: - Product Actions
  @IBAction func makeCapuchinoButton() {
    ingridientsMonitorLabel.text = firstMachine.makeDrink(drink: Drink.capuchino())
    
  }
  
  @IBAction func makeEspressoButton() {
    ingridientsMonitorLabel.text = firstMachine.makeDrink(drink: Drink.espresso())
  }
  
  
  // MARK: - UserDefaults
  func increaseRunCount() -> Int {
    let value = UserDefaults.standard.integer(forKey: Constants.runCount) + 1
    UserDefaults.standard.setValue(value, forKey: Constants.runCount)
    return value
  }
  
  
  // MARK: - Segues
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let serviceVC = segue.destination as? ServiceViewController {
      serviceVC.stringTitle = "Machine Service"
      serviceVC.cofeMachineFromMainVC = firstMachine
      serviceVC.callback = { result in
        self.showLevelOfIngridients()
        print(result)
      }
    }
    
    
  }
}
