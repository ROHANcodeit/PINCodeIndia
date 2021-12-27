//
//  ViewController.swift
//  PINIndia
//
//  Created by Rohan Tyagi on 26/12/21.
//

import UIKit
import CLTypingLabel

class ViewController: UIViewController {

    @IBOutlet weak var searchByPin: UIButton!
    @IBOutlet weak var searchByName: UIButton!
    @IBOutlet weak var searchByLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchByLabel.text="Search By..."
        corners()
    }


    func corners()
    {
        searchByPin.layer.cornerRadius = 40
        searchByName.layer.cornerRadius = 40
    }
    
    @IBAction func pinButtonPressed(_ sender: UIButton) {
        
    }
    @IBAction func nameButtonPressed(_ sender: UIButton) {
        
    }
}

