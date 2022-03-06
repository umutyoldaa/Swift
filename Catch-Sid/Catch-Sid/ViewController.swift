//
//  ViewController.swift
//  Catch-Sid
//
//  Created by Emre Koçyatağı on 1.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //Variables
    var timer = Timer()
    var hideTimer = Timer()
    var sidArray = [UIImageView]()
    var counter = 0
    var score = 0
    var highScore = 0
    
    // Views
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var sid1: UIImageView!
    @IBOutlet weak var sid2: UIImageView!
    @IBOutlet weak var sid3: UIImageView!
    @IBOutlet weak var sid4: UIImageView!
    @IBOutlet weak var sid5: UIImageView!
    @IBOutlet weak var sid6: UIImageView!
    @IBOutlet weak var sid7: UIImageView!
    @IBOutlet weak var sid8: UIImageView!
    @IBOutlet weak var sid9: UIImageView!
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let storeHighScore = UserDefaults.standard.object(forKey: "High Score")
        
        if storeHighScore == nil {
            highScore = 0
            highScoreLabel.text = "High Score \(highScore)"
        }
        
        if let newScore = storeHighScore as? Int{
            highScore = newScore
            highScoreLabel.text = "High Score \(highScore)"
        }
        counter = 30
        timeLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideSid), userInfo: nil, repeats: true)
        //Images
        sid1.isUserInteractionEnabled = true
        sid2.isUserInteractionEnabled = true
        sid3.isUserInteractionEnabled = true
        sid4.isUserInteractionEnabled = true
        sid5.isUserInteractionEnabled = true
        sid6.isUserInteractionEnabled = true
        sid7.isUserInteractionEnabled = true
        sid8.isUserInteractionEnabled = true
        sid9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        sid1.addGestureRecognizer(recognizer1)
        sid2.addGestureRecognizer(recognizer2)
        sid3.addGestureRecognizer(recognizer3)
        sid4.addGestureRecognizer(recognizer4)
        sid5.addGestureRecognizer(recognizer5)
        sid6.addGestureRecognizer(recognizer6)
        sid7.addGestureRecognizer(recognizer7)
        sid8.addGestureRecognizer(recognizer8)
        sid9.addGestureRecognizer(recognizer9)
        sidArray = [sid1, sid2, sid3, sid4, sid5, sid6, sid7, sid8, sid9]
        hideSid()
    }
    @objc func hideSid(){
        for sid in sidArray{
            sid.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(Int32(sidArray.count - 1))))
        sidArray[random].isHidden = false
        
    }
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
        print("Yakaladin")
    }
    @objc func countdown(){
        counter -= 1
        print("Timer")
        timeLabel.text = String(counter)
        if counter == 0 {
            timer.invalidate() // Timer will stop with this fun
            hideTimer.invalidate() //
            for sid in sidArray{
                sid.isHidden = true
            }
            if self.score > self.highScore{
                self.highScore = self.score
                highScoreLabel.text = "High Score: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "High Score")
            }
            let alert = UIAlertController(title: "Time is up!", message: "Do you want to play again?", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: .default){ (UIAlertAction) in
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
            
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countdown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideSid), userInfo: nil, repeats: true)
            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
        
    }

}

