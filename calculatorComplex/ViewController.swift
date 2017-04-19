//
//  ViewController.swift
//  calculatorComplex
//
//  Created by hoangdv on 4/15/17.
//  Copyright © 2017 com.hoangdv. All rights reserved.
//


//hello HoangDV

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var flag = false
    var dau = 0
    var dot = false
    
    
    @IBOutlet var lblKQ: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if ( flag == true )
        {
            lblKQ.text = String(sender.tag-1)
            numberOnScreen = Double(lblKQ.text!)!
            flag = false
        }
            
        else
        {
            lblKQ.text = lblKQ.text! + String(sender.tag - 1)
            numberOnScreen = Double(lblKQ.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if ( lblKQ.text != "" && sender.tag != 11 && sender.tag != 16 )
        {
            previousNumber = Double(lblKQ.text!)!
            if (sender.tag == 12)
            {
                lblKQ.text = "/"
            }
                
            else if (sender.tag == 13)
            {
                lblKQ.text = "X"
            }
                
            else if (sender.tag == 14)
            {
                lblKQ.text = "-"
            }
                
            else if (sender.tag == 15)
            {
                lblKQ.text = "+"
            }
                
            else if (sender.tag == 18)
            {
                lblKQ.text = String(previousNumber / 100)
            }
            
            else if (sender.tag == 17)
            {
                if ( previousNumber > 0 )
                {
                    lblKQ.text = String(previousNumber * -1)
                }
                    
                else if ( previousNumber <= 0 )
                {
                    lblKQ.text = String(previousNumber * -1)
                }
            }
            
            if (sender.tag == 19 && dot == false)
            {  //Neu click vao button "."
                lblKQ.text = lblKQ.text! + "." //Them dau "." vao
                dot = true
            }
            
            dau = sender.tag
            flag = true
        }
            
        else if (sender.tag == 16)
        {
            dot = false
            if  (dau == 12)
            {
                if (numberOnScreen == 0)
                {
                    lblKQ.text = "Not a number!!!"
                }
                    
                else
                {
                    lblKQ.text = String(previousNumber / numberOnScreen)
                }
            }
                
            else if  (dau == 13)
            {
                lblKQ.text = String(previousNumber * numberOnScreen)
            }
                
            else if  (dau == 14)
            {
                lblKQ.text = String(previousNumber - numberOnScreen)
            }
                
            else if  (dau == 15)
            {
                lblKQ.text = String(previousNumber + numberOnScreen)
            }
            flag = true
        }
            
        else if (sender.tag == 11)
        {
            lblKQ.text = ""
            previousNumber = 0
            numberOnScreen = 0
            dau = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

