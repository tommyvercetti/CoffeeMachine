//
//  ServiceViewController.swift
//  CofeeMachine
//
//  Created by Andrian Kryk on 02.02.2020.
//  Copyright © 2020 Andrian Kryk. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController {
  
  var stringTitle = "Demo"
  
  

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      navigationItem.title = stringTitle
    }
    
  @IBAction func testAddWaterButton(_ sender: UIButton) {
    print("qoo-qoo")
  }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}