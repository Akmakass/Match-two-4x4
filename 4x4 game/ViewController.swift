//
//  ViewController.swift
//  4x4 game
//
//  Created by Assel Akmakanova on 15.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var cardsName = ["1", "2", "3", "4", "5", "6", "7", "8", "1", "2", "3", "4", "5", "6", "7", "8"]
    
    var isOpened = false
    var previousButtonTag = 0
    var state = Array(repeating: false, count: 16)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func game(_ sender: UIButton) {
        if state[sender.tag - 1] {
            return
        }
        sender.setBackgroundImage(UIImage(named: cardsName[sender.tag - 1]), for: .normal)
        
        if isOpened {
            if cardsName[sender.tag - 1] == cardsName[previousButtonTag - 1] {
                state[sender.tag - 1] = true
                state[previousButtonTag - 1] = true
            } else {
                view.isUserInteractionEnabled = false
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                    sender.setBackgroundImage(nil, for: .normal)
                    
                    let previousButton = self.view.viewWithTag(self.previousButtonTag) as! UIButton
                    
                    previousButton.setBackgroundImage(nil, for: .normal)
                    
                    self.view.isUserInteractionEnabled = true
                }
            }
        } else {
            previousButtonTag = sender.tag
        }
        isOpened.toggle()
    }
}

    


