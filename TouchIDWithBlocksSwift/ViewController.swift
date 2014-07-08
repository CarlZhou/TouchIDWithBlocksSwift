//
//  ViewController.swift
//  TouchIDWithBlocksSwift
//
//  Created by Carl Zhou on 2014-07-08.
//  Copyright (c) 2014 czlabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func authenticatePressed(sender: AnyObject) {
        let reasonString = "Your reason to require TouchID Authentication"
        TouchIDWithBlocksSwift.authenticate(reasonString, success: {() -> Void in
            
            self.showAlert("Authenticate Successfully", message: "Press Ok to contine")
            
            }, failure: {(error : NSError!) -> Void in
                
                self.showAlert("Authenticate Failed", message: error.localizedDescription)
                
            })
    }
    
    func showAlert(title : NSString?, message : NSString?) {
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

