//
//  ViewController.swift
//  SpinnerPickerDemo
//
//  Created by Je Min Son on 12/14/18.
//  Copyright © 2018 Jason Son. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var spinnerPickerView: UIPickerView!
    @IBOutlet weak var selectedPickerLabel: UILabel!
    @IBOutlet weak var pickerTopLayoutConstraint: NSLayoutConstraint!
    
    var countryArray = ["South Korea", "North Korea", "America", "Japan", "China", "Canada"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Spinner Picker Demo"
    }
    
    //IBActions
    @IBAction func toolBarAction(_ sender: UIBarButtonItem) {
        
        switch sender.tag {
        case 1:
            selectedPickerLabel.text = ""
            UIView.animate(withDuration: 1.5) {
                self.pickerTopLayoutConstraint.constant = self.pickerTopLayoutConstraint.constant == 345 ? 605 : 345
                self.view.layoutIfNeeded()
            }
            selectedPickerLabel.resignFirstResponder()
        default:
            break
        }
    }

    @IBAction func showPickerBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 1.5) {
            self.pickerTopLayoutConstraint.constant = self.pickerTopLayoutConstraint.constant == 605 ? 345 : 605
            self.view.layoutIfNeeded()
        }
    }
    
}

extension HomeViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPickerLabel.text = countryArray[row]
    }
}

extension HomeViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryArray.count
    }
}

