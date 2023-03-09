//
//  ViewController.swift
//  ytapp
//
//  Created by Octav Radulian on 07.03.2023.
//

import UIKit

class ViewController: UIViewController {

    let model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var data = model.getVideos()
        
    }


}

