//
//  ViewController.swift
//  ToDoApp
//
//  Created by Matt Ariane Clarke on 17/04/2015.
//  Copyright (c) 2015 Ariane Oliveira. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButtonAction(sender: AnyObject) {
        
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemList:NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray

        
        println("button tapped");
        var dataSet:NSMutableDictionary = NSMutableDictionary()
        dataSet.setObject(titleTextField.text, forKey: "itemTitle")
        dataSet.setObject(noteTextView.text, forKey: "itemNote")
        
        
        if((itemList) != nil)
        {
            //data already available
            var newMutableArrayList:NSMutableArray = NSMutableArray()
            
            for dict:AnyObject in itemList!
            {
                newMutableArrayList.addObject(dict as! NSDictionary)
            }
            
            userDefaults.removeObjectForKey("itemList")
            newMutableArrayList.addObject(dataSet)
            userDefaults.setObject(newMutableArrayList, forKey: "itemList")
            
        }
        else{

            userDefaults.removeObjectForKey("itemList")
            itemList = NSMutableArray()
            itemList!.addObject(dataSet)
            userDefaults.setObject(itemList, forKey: "itemList")
            
        }

        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}

