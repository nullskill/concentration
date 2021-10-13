//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by ilya on 10.10.2021.
//

import Foundation

class ConcentrationGame {
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfCardPairs: Int) {
        assert(numberOfCardPairs > 0, "ConcentrationGame.init(\(numberOfCardPairs)) must have at least one pair of cards")
        
        for _ in 1...numberOfCardPairs {
            let card = Card()
            
            cards += [card, card]
        }
        
        cards.shuffle()
    }
}
