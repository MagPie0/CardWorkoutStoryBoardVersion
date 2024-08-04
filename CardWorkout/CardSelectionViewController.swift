//
//  CardSelectionViewController.swift
//  CardWorkout
//
//  Created by Maggie Hillebrecht on 8/4/24.
//

import UIKit

class CardSelectionViewController: UIViewController {
    //gives access to an object to allow changes in your code
    @IBOutlet var cardImageView: UIImageView!
    //attached the buttons in storyboard to the array
    @IBOutlet var buttons: [UIButton]!
    var cards: [UIImage] = Card.allValues
    
    var timer: Timer! //initalize right away
    
    //view controller loaded into memory
    override func viewDidLoad() {
        super.viewDidLoad()
        StartTimer()
        
        for button in buttons{
            button.layer.cornerRadius = 8
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func StartTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ShowRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func ShowRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS") //if array is empty then ace of spades will show
    }
    
    //action is what happens when the button is actually tapped
    
    @IBAction func StopButtonTapped(_ sender: UIButton) {
        timer.invalidate() //stops the timer
    }

    @IBAction func RestartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        StartTimer()
    }
    
}
