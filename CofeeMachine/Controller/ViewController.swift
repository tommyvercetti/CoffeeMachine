//
//  ViewController.swift
//  CofeeMachine
//
//  Created by Andrian Kryk on 09.01.2020.
//  Copyright © 2020 Andrian Kryk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var titleLabel: UILabel!{
    didSet{
      titleLabel.text = "Run number \(increaseRunCount())"
      
    }
  }
  
  // MARK: - Inits
  let firstMachine = CofeMachine()
  
  // MARK: - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
  }
  
  // MARK: - Service Actions
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
  
  
  //MARK: - Monitor
  @IBAction func showLevelOfIngridientsButton() {
    titleLabel.text = """
    Water tank - \(UserDefaults.standard.integer(forKey: Constants.storedWaterLevel))
    Milk tank - \(UserDefaults.standard.integer(forKey: Constants.storedMilkLevel))
    Beans tank - \(UserDefaults.standard.integer(forKey: Constants.storedBeansLevel))
    Trash bin - \(UserDefaults.standard.integer(forKey: Constants.storedTrashLevel))
    """
    titleLabel.numberOfLines = 4
  }
  
  // MARK: - Product Actions
  @IBAction func makeCapuchinoButton() {
    titleLabel.text = firstMachine.initRecipe(drink: Drink.capuchino())
    
  }

  @IBAction func makeEspressoButton() {
    titleLabel.text = firstMachine.initRecipe(drink: Drink.espresso())
  }
  
  // MARK: - UserDefaults
  func increaseRunCount() -> Int {
    let value = UserDefaults.standard.integer(forKey: Constants.runCount) + 1
    UserDefaults.standard.setValue(value, forKey: Constants.runCount)
    return value
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let serviceVC = segue.destination as? ServiceViewController {
      print("service tab opened")
      serviceVC.stringTitle = "Demo mo mo"
    }
    
  }
}



