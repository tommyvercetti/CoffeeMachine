//
//  InfoViewController.swift
//  CofeeMachine
//
//  Created by Andrian Kryk on 13.02.2020.
//  Copyright © 2020 Andrian Kryk. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
  
  var cofeMachineFromMainVC: CofeMachine!
  
  // MARK: - Outlets
  @IBOutlet weak var runCounterLabel: UILabel!{
    didSet{
      runCounterLabel.text = "Run number \(String(cofeMachineFromMainVC.restoreUserDefaults(key: Constants.runCount)))"
      
    }
  }
  
  @IBOutlet weak var cupCounterLabel: UILabel!{
    didSet{
      cupCounterLabel.text = "Cups ready \(cofeMachineFromMainVC.restoreUserDefaults(key: Constants.cupCount))"
      
    }
  }
  
  
  // MARK: - viewDidLoad
  override func viewDidLoad() {
      super.viewDidLoad()

      // Do any additional setup after loading the view.
  }
    
  

}
