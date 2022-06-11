//
//  ViewController.swift
//  PINIndia
//
//  Created by Rohan Tyagi on 26/12/21.
//

import UIKit
import CLTypingLabel

class ViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var searchByPin: UIButton!
    @IBOutlet weak var searchByName: UIButton!
    @IBOutlet weak var searchByLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        searchByLabel.text="Search By..."
        corners()
    }


    func corners()
    {
        logo.layer.cornerRadius = logo.frame.height/2
        searchByPin.layer.cornerRadius = searchByPin.frame.height/2
        searchByPin.layer.borderColor = UIColor.white.cgColor
        searchByPin.layer.borderWidth = 2
        searchByName.layer.cornerRadius = searchByName.frame.height/2
        searchByName.layer.borderColor = UIColor.white.cgColor
        searchByName.layer.borderWidth = 2
    }
    
    @IBAction func pinButtonPressed(_ sender: UIButton) {
        
    }
    @IBAction func nameButtonPressed(_ sender: UIButton) {
        
    }
}

