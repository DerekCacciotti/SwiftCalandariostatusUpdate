//
//  StatusUpdateViewController.swift
//  SwiftCalandariostatusUpdate
//
//  Created by Derek Cacciotti on 10/7/15.
//  Copyright © 2015 Derek Cacciotti. All rights reserved.
//

import UIKit

class StatusUpdateViewController: UIViewController {

    @IBOutlet weak var DoneButton: UIBarButtonItem!
    
    @IBOutlet weak var stausUpdateTextField: UITextView!
    
    @IBOutlet weak var userlabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setRightBarButtonItem(DoneButton, animated: true)
        userlabel.text = PFUser.currentUser()?.username
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func DoneButtonTapped(sender: AnyObject) {
        PostStatusUpdate()
    }
    
    
    func PostStatusUpdate()
    {
        // for now this only post the data to the backend 
       
        
        
        
        var statusUpdate = PFObject(className: "StatusUpdate")
        statusUpdate["updatetext"] = stausUpdateTextField.text
        statusUpdate["user"] = PFUser.currentUser()
        statusUpdate["url"] = "google.com"
        statusUpdate["date"] = dateLabel.text
        
        
        statusUpdate.saveInBackgroundWithBlock { (success:Bool, error:NSError?) -> Void in
            if success
            {
                print("Update saved in backend")
            }
            else
            {
                print("error")
            }
        }
        
        
        
        
    }
    
    
    @IBAction func datePickerChnged(sender: AnyObject) {
        setDate()
    }
    
    
    func setDate()
    {
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateLabel.text = dateFormatter.stringFromDate(datepicker.date)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
