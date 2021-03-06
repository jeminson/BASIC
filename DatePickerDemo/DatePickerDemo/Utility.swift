//
//  Utility.swift
//  DatePickerDemo
//
//  Created by Je Min Son on 12/14/18.
//  Copyright © 2018 Jason Son. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var ViewCorner: CGFloat {    // @IB -> design component
        get {
            return layer.cornerRadius
            
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var viewBorderWidth: CGFloat {
        get {
            return layer.borderWidth
            
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var viewBordercolor: UIColor {
        get {
            return UIColor(cgColor:layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}
