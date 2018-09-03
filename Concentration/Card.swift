//
//  Card.swift
//  Concentration
//
//  Created by Scott Chen on 8/17/18.
//  Copyright © 2018 Zewei Chen. All rights reserved.
//

import Foundation

/**
 * Struct vs. Class
 * 1. struct has no inheritance
 * 2. struct is a value type; class is a reference type
 *    (pass by value & pass by reference)
 */
struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
