//
//  PlayController.swift
//  Cycle
//
//  Created by MAC on 10/10/15.
//  Copyright © 2015 Luis Conde. All rights reserved.

import UIKit
import CoreLocation

class PlayController: UIViewController, CLLocationManagerDelegate
{
    let locationManager = CLLocationManager()
    var startLocation: CLLocation!
    @IBOutlet weak var Recorridos: UILabel!
    
    @IBOutlet weak var Velocidad: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        startLocation = nil
        
        print("Play View")
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        
    
        var speed: CLLocationSpeed = CLLocationSpeed()
        
        speed = locationManager.location!.speed
        
        print(speed)
        if speed < 0.0
        {
            self.Velocidad.text = "0.0"
        }
        else
        {
            self.Velocidad.text = "\(speed*3.6)"
        }
        
        if startLocation == nil {
            startLocation = locations.first as CLLocation?
        }
        let distance = startLocation.distanceFromLocation((locations.last as CLLocation?)!)
         
        Recorridos.text = "\(distance)"
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status != CLAuthorizationStatus.Denied{
            locationManager.startUpdatingLocation()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?)
    {
        if motion == .MotionShake
        {
            
            self.showAlert()
            
        }
    }
    
    @IBAction func call()
    {
        print("Call")
        callNumber("2222927799")
    }
    
    func showAlert()
    {
        
        
        let alertController = UIAlertController(title: "Cambio Detectado", message:
            "Hemos detectado un cambio en tu ritmo, ¿Estas bien?", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Estoy bien", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    private func callNumber(phoneNumber:String) {
        if let phoneCallURL:NSURL = NSURL(string: "tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.sharedApplication()
            if (application.canOpenURL(phoneCallURL)) {
                application.openURL(phoneCallURL);
            }
        }
    }
    
}