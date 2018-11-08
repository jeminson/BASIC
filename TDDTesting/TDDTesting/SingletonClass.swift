//
//  SingletonClass.swift
//  TDDTesting
//
//  Created by Je Min Son on 2018. 11. 8..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import Foundation


class SingletonClass {
    
    static let shared = SingletonClass()
    
    private init () {
        
    }
}
