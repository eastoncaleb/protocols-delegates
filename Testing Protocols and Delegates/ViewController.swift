//
//  ViewController.swift
//  Testing Protocols and Delegates
//
//  Created by Caleb Griffin on 9/7/18.
//  Copyright © 2018 Easton Caleb. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CanReceive {

    
    @IBOutlet weak var sendSomeDataButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var changeBackgroundButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background_2")!)
        
        sendSomeDataButton.layer.cornerRadius = 15
        sendSomeDataButton.clipsToBounds = true
        
        changeBackgroundButton.layer.cornerRadius = 15
        sendSomeDataButton.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendSomeDataButtonPressed(_ sender: Any) {
        if textField.text != "" {
            performSegue(withIdentifier: "passDataForward", sender: self)
        }
    }
    
    @IBAction func changeBackgroundButtonPressed(_ sender: Any) {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"background_3")!)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passDataForward" {
            let secondVC = segue.destination as! SecondViewController
            
            secondVC.dataPassed = textField.text!
            
            secondVC.delegate = self
            
        }
    }
    
    func dataReceived(data: String) {
        label.text = data
    }
    

    
}

