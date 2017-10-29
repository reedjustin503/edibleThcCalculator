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
    
    func createAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        //creating a button
        alert.addAction(UIAlertAction(title: "yes", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
            print("yes")
        }))
        
        alert.addAction(UIAlertAction(title: "no", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
            print("no")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var GoogleBannerView: GADBannerView!
       

    @IBOutlet weak var thcInput: UITextField!
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var splitInput: UITextField!
    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var lossFactorLabel: UILabel!
    @IBAction func slider(_ sender: UISlider) {
        lossFactorLabel.text = String(Int(sender.value))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //disssapearing text field input
        //TODO add the rest of the inputs (maybe?)
        self.thcInput.delegate = self
        
        
        GoogleBannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
        GoogleBannerView.rootViewController = self
        GoogleBannerView.load(GADRequest())
        // Do any additional setup after loading the view, typically from a nib.
     }
    
    
    
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
        if let weight = Double(weightInput.text!) {
            theWeight = weight
        } else {
            theWeight = 0
        }
        
        var desiredMgPerDose = Double()
        if let mgPerDose = Double(splitInput.text!) {
            desiredMgPerDose = mgPerDose
        } else {
            desiredMgPerDose = 0
        }
        
        
        if theThc != 0 && theWeight != 0 && desiredMgPerDose != 0 {
            let numberOfSplits = ((theThc * 0.01) * (theWeight * 1000.0) * lossFactor) / desiredMgPerDose
            display.text = "split it \(numberOfSplits) ways"
        } else{
            display.text = "nope"
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

