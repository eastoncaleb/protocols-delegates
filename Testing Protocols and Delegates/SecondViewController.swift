//
//  SecondViewController.swift
//  Testing Protocols and Delegates
//
//  Created by Caleb Griffin on 9/7/18.
//  Copyright © 2018 Easton Caleb. All rights reserved.
//

import UIKit

protocol CanReceive {
    func dataReceived(data : String)
}

class SecondViewController: UIViewController {
    
    var delegate : CanReceive?

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendSomeDataBackButton: UIButton!
    
    var dataPassed : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        sendSomeDataBackButton.layer.cornerRadius = 15
        sendSomeDataBackButton.clipsToBounds = true
        // Do any additional setup after loading the view.
        
        if dataPassed != "" {
            label.text = dataPassed
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func sendSomeDataBackButtonPressed(_ sender: Any) {
        if textField.text != "" {
        delegate?.dataReceived(data: textField.text!)
        self.dismiss(animated: true, completion: nil)
        }
    }
    

}
