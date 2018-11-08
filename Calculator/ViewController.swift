//
//  ViewController.swift
//  Calculator
//
//  Created by Nguyen Phuoc An on 11/1/18.
//  Copyright © 2018 Nguyen Phuoc An. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOfScreen:Double = 0;
    var previousNumbers:Double = 0;
    var performingMath:Bool = true;
    var operators:Int = 0
    
    @IBOutlet weak var screen: UILabel!
    @IBOutlet weak var preScreen: UILabel!
    
    func displayPreScreen(){
        if operators >= 14 && operators <= 17{
            preScreen.text = String(previousNumbers)
            switch operators{
            case 14:
                preScreen.text = preScreen.text! + "/"
                break
            case 15:
                preScreen.text = preScreen.text! + "x"
                break
            case 16:
                preScreen.text = preScreen.text! + "-"
                break
            case 17:
                preScreen.text = preScreen.text! + "+"
                break
            default:
                break
            }
        }
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        displayPreScreen()
        if screen.text == "0"{
            performingMath = true
        }
        if performingMath == true{
            screen.text = String(sender.tag)
            numberOfScreen = Double(screen.text!)!
            performingMath = false
        }
        else{
            screen.text = screen.text! + String(sender.tag)
            numberOfScreen = Double(screen.text!)!
        }
        
        
    }
    
    func calc(){
        switch operators{
        case 14:
            numberOfScreen = previousNumbers/numberOfScreen
            break
        case 15:
            numberOfScreen = previousNumbers*numberOfScreen
            break
        case 16:
            numberOfScreen = previousNumbers-numberOfScreen
            break
        case 17:
            numberOfScreen = previousNumbers+numberOfScreen
            break
        default:
            
            break
        }
        //previousNumbers = 0
        
    }
    
    @IBAction func operation(_ sender: UIButton) {
        if sender.tag >= 14 && sender.tag <= 17{
            
            performingMath = true
            calc()
            operators = sender.tag
            previousNumbers = numberOfScreen
            numberOfScreen = 0
            switch sender.tag{
            case 14:    //divide        -- button [/]
                screen.text = "/"
                break
            case 15:    //multiply      -- button [x]
                screen.text = "x"
                break
            case 16:    //minus         -- button [-]
                screen.text = "-"
                break
            case 17:    //plus          -- button [+]
                screen.text = "+"
                break
            default:
                break
            }
            displayPreScreen()
        }
        else if sender.tag == 18{   //equal         -- button [=]
            preScreen.text = ""
            performingMath = true
            calc()
            screen.text = String(numberOfScreen)
            previousNumbers = 0
            operators = 0
        }
        else if sender.tag == 12{   //clear -- button [C]
            preScreen.text = ""
            numberOfScreen = 0
            previousNumbers = 0
            operators = 0
            performingMath = true
            screen.text = "0"
        }
        else if sender.tag == 11{   //clear memory temple   -- button [CE]
            performingMath = true
            screen.text = "0"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

