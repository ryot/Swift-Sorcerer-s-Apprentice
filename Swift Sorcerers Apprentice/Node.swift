//
//  Node.swift
//  Swift Sorcerers Apprentice
//
//  Created by Ryo Tulman on 6/21/14.
//  Copyright (c) 2014 Ryo Tulman. All rights reserved.
//

import Foundation

class Node {
    
    let value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    convenience init() {
        self.init(value: 0)
    }
}