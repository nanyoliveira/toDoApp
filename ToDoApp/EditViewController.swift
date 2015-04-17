//
//  EditViewController.swift
//  ToDoApp
//
//  Created by Matt Ariane Clarke on 17/04/2015.
//  Copyright (c) 2015 Ariane Oliveira. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!

    var toDoData:NSDictionary = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.userInteractionEnabled = false;
        noteTextView.userInteractionEnabled = false;
        
        self.titleTextField.text = toDoData.objectForKey("itemTitle") as! String
        self.noteTextView.text = toDoData.objectForKey("itemNote") as! String
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteData(sender: AnyObject) {
        
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemListArray:NSMutableArray = userDefaults.objectForKey("itemList") as! NSMutableArray
        
        var mutableItemList:NSMutableArray =  NSMutableArray()
        
        for dic:AnyObject in itemListArray
        {
            mutableItemList.addObject(dic)
        }
        
        mutableItemList.removeObject(toDoData)
        userDefaults.removeObjectForKey("itemList")
        userDefaults.setObject(mutableItemList, forKey: "itemList")
        userDefaults.synchronize()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
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
