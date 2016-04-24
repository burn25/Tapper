//
//  ViewController.swift
//  Tapper
//
//  Created by Jeremy Burnham on 4/24/16.
//  Copyright © 2016 Jeremy Burnham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //outlets
    @IBOutlet weak var logoImg:UIImageView!
    @IBOutlet weak var howManyTapsTxt:UITextField!
    @IBOutlet weak var playButton:UIButton!
    
    @IBOutlet weak var tapButton:UIButton!
    @IBOutlet weak var tapsLabel:UILabel!
    
    //variables
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    @IBAction func onPlayButtonPressed(sender: UIButton!) {
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
            logoImg.hidden = true
            playButton.hidden = true
            howManyTapsTxt.hidden = true
            
            tapButton.hidden = false
            tapsLabel.hidden = false
            
            updateTapsLabel()
        }
    }

    @IBAction func onCoinTapped(sender: UIButton!) {
        currentTaps += 1
        
        updateTapsLabel()
        
        if isGameOver() {
            restartGame()
        }
    }
    
    func updateTapsLabel() {
        tapsLabel.text = "\(currentTaps) Taps"
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        }
        
        return false
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        logoImg.hidden = false
        playButton.hidden = false
        howManyTapsTxt.hidden = false
        
        tapButton.hidden = true
        tapsLabel.hidden = true
        
    }

}

