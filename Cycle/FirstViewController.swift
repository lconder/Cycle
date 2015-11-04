//
//  FirstViewController.swift
//  Cycle
//
//  Created by MAC on 09/10/15.
//  Copyright © 2015 Luis Conde. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("First Controller")
        img.layer.cornerRadius = img.frame.size.width/2
            //img.clipsToBounds = true
        img.layer.masksToBounds = true
        img.layer.borderWidth = 0.1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

