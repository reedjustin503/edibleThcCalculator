//
//  ViewController.swift
//  edibleThcCalculator
//
//  Created by Justin Reed on 9/25/17.
//  Copyright © 2017 RD concepts. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, UITextFieldDelegate {
    
    //Set up connected variables for edible calculation
    @IBOutlet weak var GoogleBannerView: GADBannerView!
    @IBOutlet weak var thcInput: UITextField!
    @IBOutlet weak var weight: MaxLengthTextField!
    @IBOutlet weak var unitsInBatch: MaxLengthTextField!
    

    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var totalDisplay: UILabel!
    
    @IBOutlet weak var lossFactorLabel: UILabel!
    
    //Method to update the value for the conversion slider.
    @IBAction func slider(_ sender: UISlider) {
        lossFactorLabel.text = String(Int(sender.value))
        //capture user default here
        UserDefaults.standard.set(Int(lossFactorLabel.text!), forKey: "conversionFactor")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting user default for conversion factor
        if let x = UserDefaults.standard.object(forKey: "conversionFactor") as? Int {
            lossFactorLabel.text = String(x)
        } else {
            lossFactorLabel.text = "70"
        }
        
        
        
        // TEST Google Ad Mob AdUNIT
        GoogleBannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        
        // Real Google Ad Mob AdUNIT
        //GoogleBannerView.adUnitID = "ca-app-pub-4186253562269967/1810673377"
        
        
        GoogleBannerView.rootViewController = self
        GoogleBannerView.load(GADRequest())
        // Do any additional setup after loading the view, typically from a nib.
     }
    
    
    // Move to the information storyboard using a segue
    @IBAction func showPopUp(_ sender: UIButton) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpId") as! PopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    
    
    
    
    
       @IBAction func calculate(_ sender: UIButton) {
        
        let lossFactor = (Double(lossFactorLabel.text!))! * 0.01
        
        var theThc = Double()
        if let thc = Double(thcInput.text!) {
            theThc = thc
        } else {
           theThc = 0
        }
        
        var theWeight = Double()
        if let weight = Double(weight.text!) {
            theWeight = weight
        } else {
            theWeight = 0
        }
        
        var currentMGPerDose = Double()
        if let mgPerDose = Double(unitsInBatch.text!) {
            currentMGPerDose = mgPerDose
        } else {
            currentMGPerDose = 0
        }
        
        
        if theThc != 0 && theWeight != 0 && currentMGPerDose != 0 {
            let numberOfSplits = (((theThc * 0.01) * (theWeight * 1000.0)) * lossFactor) / currentMGPerDose
            let thcMgTotal = ((theThc * 0.01) * (theWeight * 1000.0) * lossFactor)
            
            totalDisplay.text = "\(String(format: "%.2f",thcMgTotal))mg thc total."
            display.text = "\(unitsInBatch.text!) units with \(String(format: "%.2f",numberOfSplits)) mg in each dose"
        } else{
            display.text = "please fill out all fields"
        }
        
        
        
        
        
        
        
        
        

        
        
        
        
        
        
        
        
        
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//Hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

