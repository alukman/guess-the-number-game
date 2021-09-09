//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by Andrew Widjaja on 9/9/21.
//  Copyright © 2021 Andrew Lukman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let lowerBound = 1
    let upperBound = 100
    var numberToGuess: Int!
    var numberOfGuesses = 0

    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateRandomNumber()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(100)) + 1
        print("WINNING NUMBER: " + String(numberToGuess))
    }
    
    func startNewGame() {
        guessTextField.text = ""
        numberOfGuesses = 0;
        generateRandomNumber();
    }
    
    func validateGuess(_ guess: Int) {
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
        if guess < lowerBound || guess > upperBound {
            alert.title = "Out of bounds"
            alert.message = "Number must be within 1-100"
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if guess < numberToGuess {
            alert.title = "Too Low!"
            alert.message = "Try to guess higher"
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if guess > numberToGuess {
            alert.title = "Too High!"
            alert.message = "Try to guess lower"
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            alert.title = "You win!"
            alert.message = "Number of guesses: " + String(numberOfGuesses)
            alert.addAction(UIAlertAction(title: "New Game", style: UIAlertActionStyle.default, handler: { action in
                self.startNewGame()}))
            self.present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if let guess = guessTextField.text {
            if let guessInt = Int(guess) {
                numberOfGuesses += 1
                print(guessInt)
                validateGuess(guessInt)
            }
        }
    }

}

