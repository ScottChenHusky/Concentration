//
//  Concentration.swift
//  Concentration
//
//  Created by Scott Chen on 8/17/18.
//  Copyright © 2018 Zewei Chen. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int) {
        
        // 0...12 (means 0 to 12 inclusive)
        // 0..<12 (means o to 11 inclusive)
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            // since Card is struct, it gets passed by value not reference
            cards += [card, card]
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
    }
}
