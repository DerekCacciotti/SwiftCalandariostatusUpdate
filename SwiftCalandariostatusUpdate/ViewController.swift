//
//  ViewController.swift
//  SwiftCalandariostatusUpdate
//
//  Created by Derek Cacciotti on 10/7/15.
//  Copyright © 2015 Derek Cacciotti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PFLogInViewControllerDelegate {

  // this will handle the login in my swift project
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var loginView = PFLogInViewController()
        
        loginView.delegate = self
        self.presentViewController(loginView, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // parse login methods
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        // present welcome screen
        print("user logged in")
        WelcomeScreen()
        
    }
    
    func logInViewControllerDidCancelLogIn(logInController: PFLogInViewController) {
        self.dismissViewControllerAnimated(true, completion: nil)
        print("login canceled")
    }
    
    
    func WelcomeScreen()
    {
        print("called")
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let welcomeVC = sb.instantiateViewControllerWithIdentifier("welcome") as! WelcomeViewController
        let NC = UINavigationController(rootViewController: welcomeVC)
        self.presentViewController(NC, animated: true, completion: nil)
    }


}

