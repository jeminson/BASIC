//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Je Min Son on 12/19/18.
//  Copyright © 2018 Jason Son. All rights reserved.
//

import UIKit
import CoreData

// 1. Refer the Container
let appDelegate = UIApplication.shared.delegate as! AppDelegate
// 2. Create context from this container
let context = appDelegate.persistentContainer.viewContext

class HomeViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    // MARK : - IBActions
    @IBAction func saveBtnAction(_ sender: UIButton) {
        
        // 3. Create entity and new record
        if (usernameTextField.text != nil) && (passwordTextField.text != nil) && (ageTextField.text != nil) {
            let userRecord = Users(context: context)
            userRecord.username = usernameTextField.text!
            userRecord.password = passwordTextField.text!
            userRecord.age = ageTextField.text!
            appDelegate.saveContext()
        }
    }
    
    @IBAction func fetchBtnAction(_ sender: UIButton) {
        fetchData()
    }
    
    @IBAction func deleteBtnAction(_ sender: UIButton) {
        if sender.tag == 1 {
            deleteAllRecords()
        } else {
            deleteEachRecords(username: usernameTextField.text!)
        }
        
    }
    
}

extension HomeViewController {
    func fetchData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(fetchRequest) as! [Users]
            for users in result {
                print("username:  \(users.username!)")
                print("password:  \(users.password!)")
                print("age:  \(users.age!)")
                print("------------------------------------------")
            }
        } catch {
            print("Error")
        }
    }
    
    func deleteAllRecords() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            let _ = try context.execute(deleteRequest)
        } catch {
            print("Error")
        }
        saveContext()
    }
    
    func deleteEachRecords(username: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        let predicate = NSPredicate(format: "username == %@", username)
        
        fetchRequest.predicate = predicate
        
        do {
            let result = try context.fetch(fetchRequest) as! [Users]
            for data in result {
                context.delete(data)
            }
        } catch {
            print("Error")
        }
        saveContext()
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error")
            }
        }
    }
    
}

