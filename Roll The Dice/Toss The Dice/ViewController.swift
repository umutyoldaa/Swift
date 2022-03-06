//
//  ViewController.swift
//  Toss The Dice
//
//  Created by Emre Koçyatağı on 27.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player2: UIImageView!
    @IBOutlet weak var player1: UIImageView!
    // I creare an array which contains pictures of dice.
    let items = [UIImage(named: "dice1"), UIImage(named: "dice2"), UIImage(named: "dice3"), UIImage(named: "dice4"), UIImage(named: "dice5"), UIImage(named: "dice6")]
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btn(_ sender: Any) {
        let right = Int(arc4random_uniform(6))
        let left = Int(arc4random_uniform(6))// With arch4.. func we create a constant and this one is each time will pick the number between 1...6
        player1.image = items[right]
        player2.image = items[left]
    }
   
}

