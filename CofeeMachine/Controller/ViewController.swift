//
//  ViewController.swift
//  CofeeMachine
//
//  Created by Andrian Kryk on 09.01.2020.
//  Copyright © 2020 Andrian Kryk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!{
    didSet{
      titleLabel.text = "Run number \(increaseRunCount())"
      
    }
  }
  
  let firstMachine = CofeMachine()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
  }
  
  //UserDefaults
  func increaseRunCount() -> Int {
    let value = UserDefaults.standard.integer(forKey: "runCount") + 1
    UserDefaults.standard.setValue(value, forKey: "runCount")
    return value
  }
  
  @IBAction func addMilkButton() {
    titleLabel.text = firstMachine.makeService(type: IngridientType.milk)
  }
  
  @IBAction func addWaterButton() {
    titleLabel.text = firstMachine.makeService(type: IngridientType.water)
  }
  
  @IBAction func addBeansButton() {
    titleLabel.text = firstMachine.makeService(type: IngridientType.beans)
  }
  
  @IBAction func cleanBinButton(_ sender: UIButton) {
    titleLabel.text = firstMachine.makeService(type: IngridientType.trash)
  }
  
  @IBAction func showLevelOfIngridientsButton() {
    titleLabel.text = """
    Water tank - \(firstMachine.waterTankLevel)
    Milk tank - \(firstMachine.milkTankLevel)
    Beans tank - \(firstMachine.beansTankLevel)
    Trash bin - \(firstMachine.trashBinLevel)
    """
    titleLabel.numberOfLines = 4
  }
  
  @IBAction func makeCapuchinoButton() {
    titleLabel.text = firstMachine.initRecipe(drink: Drink.capuchino())
    
  }

  @IBAction func makeEspressoButton() {
    titleLabel.text = firstMachine.initRecipe(drink: Drink.espresso())
  }
}



