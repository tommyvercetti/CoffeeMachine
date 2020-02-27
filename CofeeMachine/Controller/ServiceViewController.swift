//
//  ServiceViewController.swift
//  CofeeMachine
//
//  Created by Andrian Kryk on 02.02.2020.
//  Copyright © 2020 Andrian Kryk. All rights reserved.

import UIKit

class ServiceViewController: UIViewController {
  
  var stringTitle: String = ""
  var cofeMachineFromMainVC: CofeMachine!
  var callback : ((String) -> ())?
  
  @IBOutlet weak var ingridientsMonitorLabel: UILabel!{
    didSet{
      showLevelOfIngridients()
    }
  }
  
  
  
  // MARK: - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    navigationItem.title = stringTitle
    
  }
  
  
  //MARK: - Monitor
  func showLevelOfIngridients() {
    ingridientsMonitorLabel.text =
    """
    Water tank - \(cofeMachineFromMainVC.restoreUserDefaults(key: Constants.storedWaterLevel))
    Milk tank - \(cofeMachineFromMainVC.restoreUserDefaults(key: Constants.storedMilkLevel))
    Beans tank - \(cofeMachineFromMainVC.restoreUserDefaults(key: Constants.storedBeansLevel))
    Trash bin - \(cofeMachineFromMainVC.restoreUserDefaults(key: Constants.storedTrashLevel))
    """
    ingridientsMonitorLabel.numberOfLines = 4
  }
  
  @IBAction func showLevelOfIngridientsButton() {
    showLevelOfIngridients()
  }
  
  
  // MARK: - Service Actions
  @IBAction func addWaterButton(_ sender: UIButton) {
    ingridientsMonitorLabel.text = cofeMachineFromMainVC.makeService(type: IngridientType.water)
    callback?(ingridientsMonitorLabel.text ?? "")
    
  }
  
  @IBAction func addMilkButton(_ sender: UIButton) {
    ingridientsMonitorLabel.text = cofeMachineFromMainVC.makeService(type: IngridientType.milk)
    callback?(ingridientsMonitorLabel.text ?? "")
    
  }
  
  @IBAction func addBeansButton(_ sender: UIButton) {
    ingridientsMonitorLabel.text = cofeMachineFromMainVC.makeService(type: IngridientType.beans)
    callback?(ingridientsMonitorLabel.text ?? "")
    
  }
  
  @IBAction func cleanBinButton(_ sender: UIButton) {
    ingridientsMonitorLabel.text = cofeMachineFromMainVC.makeService(type: IngridientType.trash)
    callback?(ingridientsMonitorLabel.text ?? "")
    
  }

 
}
