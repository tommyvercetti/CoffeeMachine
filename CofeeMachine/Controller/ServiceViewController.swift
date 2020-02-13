//
//  ServiceViewController.swift
//  CofeeMachine
//
//  Created by Andrian Kryk on 02.02.2020.
//  Copyright © 2020 Andrian Kryk. All rights reserved.
//
//создать в первой вьюхе в перпаре сегвей переменную, в котороую отсылать экземпляр первой кофе машины. а во втором вьюконтроллере шатать эту переменную

import UIKit

class ServiceViewController: UIViewController {
  
  var stringTitle: String = ""
  var cofeMachineFromMainVC: CofeMachine!
  var callback : ((String)->())?
  
  @IBOutlet weak var ingridientsMonitorLabel: UILabel!{
    didSet{
      showLevelOfIngridients()
    }
  }
  
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
    callback?(ingridientsMonitorLabel.text ?? "")
  }
  
  @IBAction func showLevelOfIngridientsButton() {
    showLevelOfIngridients()
  }
  
  
  // MARK: - Service Actions
  @IBAction func addWaterButton(_ sender: UIButton) {
    ingridientsMonitorLabel.text = cofeMachineFromMainVC.makeService(type: IngridientType.water)
  }
  
  @IBAction func addMilkButton(_ sender: UIButton) {
    ingridientsMonitorLabel.text = cofeMachineFromMainVC.makeService(type: IngridientType.milk)
    
  }
  
  @IBAction func addBeansButton(_ sender: UIButton) {
    ingridientsMonitorLabel.text = cofeMachineFromMainVC.makeService(type: IngridientType.beans)
  }
  
  @IBAction func cleanBinButton(_ sender: UIButton) {
    ingridientsMonitorLabel.text = cofeMachineFromMainVC.makeService(type: IngridientType.trash)
  }
  
  
  // MARK: - Segues
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  //  @IBAction func testShowMilkButton(_ sender: UIButton) {
  //    print("qoo-qoo")
  //    print("level is - \(cofeMachineFromMainVC.restoreUserDefaults(key: Constants.storedMilkLevel))")
  //    milkLevelServiceVC.text = String(cofeMachineFromMainVC.restoreUserDefaults(key: Constants.storedMilkLevel))
  //
  //  }
  //
  //  @IBAction func testAddMilkButton(_ sender: UIButton) {
  ////    cofeMachineFromMainVC.milkTankLevel += cofeMachineFromMainVC.milkPortion
  //    cofeMachineFromMainVC.makeService(type: IngridientType.milk)
  //    print("\(cofeMachineFromMainVC.milkPortion) water aded")
  //    print("now level of milk is - \(cofeMachineFromMainVC.restoreUserDefaults(key: Constants.storedMilkLevel))")
  //
  //
  //  }
  //
  //
  //  @IBAction func addMilkButton(_ sender: UIButton) {
  //    cofeMachineFromMainVC.makeService(type: IngridientType.milk)
  //
  //  }
  //
  //  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  //    //
  //  }
  
  
  
  
  
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
