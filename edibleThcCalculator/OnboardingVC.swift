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
    
    func createAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        //creating a button
        alert.addAction(UIAlertAction(title: "yes", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
            //send to the main view and store a string in user defaults
            UserDefaults.standard.set("placeholder", forKey: "name")
            performSegue(withIdentifier: "toMainSegue", sender: OnboardingVC)
            print("yes")
        }))
        
        alert.addAction(UIAlertAction(title: "no", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
            //send to dead page and do nothing
            print("no")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        createAlert(title: "Are you 21 or over?", message: "-")
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    

    
}

