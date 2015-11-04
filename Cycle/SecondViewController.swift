//
//  SecondViewController.swift
//  Cycle
//
//  Created by MAC on 09/10/15.
//  Copyright © 2015 Luis Conde. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController
{

    @IBOutlet weak var Marca: UITextField!
    @IBOutlet weak var Color: UITextField!
    @IBOutlet weak var Rodada: UITextField!
    
    
    var temp = "Vacio"
    var Bicicleta=NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print ("Mi Bici")
     
        Marca.text = Bicicleta.valueForKey("Marca") as? String
        Color.text = Bicicleta.valueForKey("Color") as? String
        Rodada.text = Bicicleta.valueForKey("Rodada") as? String
        Marca.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


    @IBAction func Save()
    {
        self.view.endEditing(true)
        
        temp = Marca.text!
        Bicicleta.setValue(temp, forKey: "Marca")
        temp = Color.text!;
        Bicicleta.setValue(temp, forKey: "Color")
        temp = Rodada.text!
        Bicicleta.setValue(temp, forKey: "Rodada")
        Bicicleta.synchronize()
    }
}

