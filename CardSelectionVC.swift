//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by MiracMacPro on 9.07.2024.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    @IBOutlet var cardImageView: UIImageView!
    var cards: [UIImage] = Card.allValues
    var timer: Timer!

    @IBOutlet var switchTheme: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        switchTheme.setOn(false, animated: true)
        startTimer()
     
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
    @IBAction func rulesButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func swithThemeTapped(_ sender: Any) {
        if switchTheme.isOn {
            overrideUserInterfaceStyle = .light
            switchTheme.setOn(true, animated: true)
        } else {
            overrideUserInterfaceStyle = .dark
            switchTheme.setOn(false, animated: true)
        }
    }
    
    

}
