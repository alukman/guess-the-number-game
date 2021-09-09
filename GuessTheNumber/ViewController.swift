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
    }

    @IBAction func submitButtonPressed(_ sender: UIButton) {
        generateRandomNumber()
        print("\(numberToGuess)")
    }

}

