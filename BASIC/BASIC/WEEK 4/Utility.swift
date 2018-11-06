//
//  String+Helper.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 5..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var length: Int {
        return self.count
    }
    
    var upper: String {
        return self.uppercased()
    }
    
    var lower: String {
        return self.lowercased()
    }
    
}

extension UserDefaults {
    
    //MARK: - Class
    
    class func get(key:String) -> Any? {
        return UserDefaults.standard.get(key: key)
    }
    
    class func set(value:Any?, key:String, synchronize:Bool = true) {
        UserDefaults.standard.set(value: value, key: key, synchronize: synchronize)
    }
    
    //MARK: - Instance
    
    public func get(key:String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
    
    public func set(value: Any?, key: String, synchronize: Bool = true) {
        self.setValue(value, forKey: key)
        if synchronize {
            self.synchronize()     // Sometimes data won't be saved, so always put sychronize() to make sure it is saved 
        }
    }
    
}

extension Date {
    var tomorrow: Date? {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)
    }
    
    var dayAfterTmrw: Date? {
        return Calendar.current.date(byAdding: .day, value: 2, to: self)
    }
    
    var yesterday: Date? {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)
    }
}

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
