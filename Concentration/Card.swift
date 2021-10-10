//
//  Card.swift
//  Concentration
//
//  Created by ilya on 10.10.2021.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierNumber = 0
    
    static func identifierGenerator() -> Int {
        identifierNumber += 1
        
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierGenerator()
    }
}
