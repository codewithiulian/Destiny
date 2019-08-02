//
//  ViewController.swift
//  Destiny
//
//  Created by Iulian Oana on 01/08/2019.
//  Copyright © 2019 Iulian Oana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let story1 = "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\"."
    let answer1a = "I\'ll hop in. Thanks for the help!"
    let answer1b = "Better ask him if he\'s a murderer first."
    
    
    let story2 = "He nods slowly, unphased by the question."
    let answer2a = "At least he\'s honest. I\'ll climb in."
    let answer2b = "Wait, I know how to change a tire."
    
    let story3 = "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box."
    let answer3a = "I love Elton John! Hand him the cassette tape."
    let answer3b = "It\'s him or me! You take the knife and stab him."
    
    let story4 = "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?"
    let story5 = "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in."
    let story6 = "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\""
    
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var storyTextView: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    
    // TODO Step 5: Initialise instance variables here
    var currentStory = 0;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        // Update the story.
        updateStory(story1, 1)
        // Set the buttons text.
        updateButtons(answer1a, answer1b)
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        // If the top button has been pressed.
        if currentStory == 1 && (sender.tag == 1 || currentStory == 2) {
            updateStory(story3, 3)
            updateButtons(answer3a, answer3b)
        }
        else if currentStory == 1 && sender.tag == 2 {
            updateStory(story2, 2)
            updateButtons(answer2a, answer2b)
        }
        else if currentStory == 2 && sender.tag == 2 {
            updateStory(story4, 4)
            hideButtons()
        }
        else if currentStory == 3 {
            if sender.tag == 1 {
                updateStory(story6, 6)
                hideButtons()
            }
                // Or if the bottom botton has been pressed.
            else if sender.tag == 2{
                updateStory(story5, 5)
                hideButtons()
            }
        }
    }
    
    @IBAction func restartPressed() {
        updateStory(story1, 1)
        updateButtons(answer1a, answer1b)
        showButtons()
    }
    
    
    func updateButtons(_ button1: String, _ button2: String){
        topButton.setTitle(button1, for: UIControl.State.normal)
        bottomButton.setTitle(button2, for: UIControl.State.normal)
    }
    
    func updateStory(_ story: String, _ number: Int) {
        currentStory = number;
        storyTextView.text = story
        if number >= 4 {
            restartButton.isHidden = false
        }else{
            restartButton.isHidden = true
        }
    }
    
    func hideButtons() {
        topButton.isHidden = true
        bottomButton.isHidden = true
    }
    
    func showButtons() {
        topButton.isHidden = false
        bottomButton.isHidden = false
    }
}

