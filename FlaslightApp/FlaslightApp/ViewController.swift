//
//  ViewController.swift
//  FlaslightApp
//
//  Created by Emre Koçyatağı on 16.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Elements
     var button = true
    @IBOutlet var lightOn :UIButton!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        lighton()
        
    }
    // MARK: - Actions

    @IBAction func buttonOnOff(_ sender: Any) {
        button.toggle()
        lighton()

    }
    //MARK: - Functions
    
    func lighton(){
        view.backgroundColor = button ? .white : .black

       /*
        // If you want, you can add an button and write there "Off" and "On"
        //and those label will appear when the button.
        //For example when it's dark, it's written On inside the button. When it's light it's written On.
        // find more information in the read-me file
        if button{
            view.backgroundColor = .white
            lightOn.setTitle("off", for: .normal)
            
        }else{
            view.backgroundColor = .black
            lightOn.setTitle("On", for: .normal)
}
        */
        
    
        }
}
