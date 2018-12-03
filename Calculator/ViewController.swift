//
//  ViewController.swift
//  Calculator
//
//  Created by Jacey on 11/22/18.
//  Copyright © 2018 Jacey. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var operation = 0;
    
@IBOutlet weak var label: UILabel!
    
@IBAction func numbers(_ sender: UIButton)
{
    if performingMath == true
    {
        label.text = String((sender as AnyObject).tag-1)
        numberOnScreen = Double(label.text!)!
        performingMath = false
    }
    else
    {
    label.text = label.text! + String((sender as AnyObject).tag-1)
    numberOnScreen = Double(label.text!)!
    }
}
    
    
@IBAction func buttons(_ sender: UIButton)
{
    if label.text != "" && (sender as AnyObject).tag != 11 && (sender as AnyObject).tag != 16
    {
        previousNumber = Double(label.text!)!
        
        if (sender as AnyObject).tag == 12 //DIVIDE
        {
            label.text = "/";
        }
        else if (sender as AnyObject).tag == 13 //MULT.
        {
            label.text = "x";
        }
        else if (sender as AnyObject).tag == 14 //MINUS
        {
            label.text = "-";
        }
        else if (sender as AnyObject).tag == 15 //ADD
        {
            label.text = "+";
        }
        operation = sender.tag
        performingMath = true
    }
    else if sender.tag == 16
    {
        if operation == 12
        {
            label.text = String(previousNumber / numberOnScreen)
        }
        else if operation == 13
        {
            label.text = String(previousNumber * numberOnScreen)
        }
        else if operation == 14
        {
            label.text = String(previousNumber - numberOnScreen)
        }
        else if operation == 15
        {
            label.text = String(previousNumber + numberOnScreen)
        }
    }
    else if sender.tag == 11
    {
        label.text = ""
        previousNumber = 0;
        numberOnScreen = 0;
        operation = 0;
    }
}
    
override func viewDidLoad()
{
    super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
}

override func didReceiveMemoryWarning()
{
    super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
}

