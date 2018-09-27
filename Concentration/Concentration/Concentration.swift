//
//  Concentration.swift
//  Concentration
//
//  Created by Chuong Bui on 9/7/18.
//  Copyright © 2018 Chuong Bui. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var indexOfOnlyAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index : Int) {
        if !cards[index].isMatched {
            // case 1: only one card is currently face up
            if let matchIndex = indexOfOnlyAndOnlyFaceUpCard, matchIndex != index {
                // checks if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOnlyAndOnlyFaceUpCard = nil
            } else {
                // case 2: either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOnlyAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        
    }
}
