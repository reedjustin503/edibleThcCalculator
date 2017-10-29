//
//  OnboardingVC.swift
//  edibleThcCalculator
//
//  Created by Justin Reed on 10/28/17.
//  Copyright © 2017 RD concepts. All rights reserved.
//

import Foundation
import UIKit


class OnboardingVC: UIViewController  {
    
    @IBAction func yesTouched(_ sender: UIButton) {
        
        UserDefaults.standard.set("placeholder", forKey: "name")
        performSegue(withIdentifier: "toMainSegue", sender: self)
    }
    
    @IBAction func noTouched(_ sender: UIButton) {
        performSegue(withIdentifier: "toPurgatoryVC", sender: self)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    

    
}

