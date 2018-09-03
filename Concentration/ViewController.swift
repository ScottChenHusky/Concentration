//
//  ViewController.swift
//  Concentration
//
//  Created by Scott Chen on 8/16/18.
//  Copyright © 2018 Zewei Chen. All rights reserved.
//

// Bring all the UI tools, button, etc
import UIKit

// ViewController is the class name
// UIViewController is its super class
class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    // var: this is a varibale
    // flipCount: var name
    // Int: var type
    var flipCount = 0 {
        // everytime flipCount changes,
        // it will update flipCountLabel
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    // IBOutlet: a directive
    // weak:
    // !:
    @IBOutlet weak var flipCountLabel: UILabel!
    
    // Colletion is an array
    // or it can be written like @IBOutlet var cardButtons: Array<UIButton>!
    @IBOutlet var cardButtons: [UIButton]!
    
    
    // IBAction: a directive
    // func: key word of function
    // touchCard: name of the method
    // sender: name of the argument
    // UIButton: type of the argument
    // if the method has return value:
    // @IBAction func touchCard(_ sender: UIButton) -> Int {}
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        // if a var is never mutate, it should be set as const which is let
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chose card was not in cardButton")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else {
//            return "?"
//        }
        return emoji[card.identifier] ?? "?"
    }

    func flipCard(withEmoji emoji: String, on button: UIButton) {
        
        // \(...) will directly print out the value in ()
        print("flipCard(withEmojiL \(emoji)")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

