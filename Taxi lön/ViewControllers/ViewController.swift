//
//  ViewController.swift
//  Taxi lön
//
//  Created by Patrik Persson Avd 12 on 2018-02-06.
//  Copyright © 2018 Transportarbetareförbundet. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

   
    @IBOutlet weak var garantiConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var monthConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var faqConstraint: NSLayoutConstraint!
    
    
    
    var tapCount = 0
    var bombSoundEffect: AVAudioPlayer?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        garantiConstraint.constant -= view.bounds.width
        monthConstraint.constant -= view.bounds.width
        faqConstraint.constant -= view.bounds.width
    
        
    }
    
    
    
    var animationPerformedOnce = false
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !animationPerformedOnce{
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.garantiConstraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseOut, animations: {
                self.monthConstraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0.4, options: .curveEaseOut, animations: {
                self.faqConstraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            animationPerformedOnce = true
        }
        
        
    
        
        
    }
    
    
    
    
    
    
    
    @IBAction func button(_ sender: Any) {
   
        
        
        if tapCount < 11 {
            tapCount += 1
        } else {
            showAlertWith(title: "Du har hittat hit!", message: "Denna app utvecklades av Patrik Persson på Transports avdelning 12 i Malmö")
            
            tapCount = 0
        }
    }
    
    
    
    func showAlertWith(title: String, message: String, style: UIAlertControllerStyle = .alert){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: dismissAlert)
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
        let path = Bundle.main.path(forResource: "audio.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    func dismissAlert(sender: UIAlertAction) -> Void {
        bombSoundEffect?.stop()
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    
    
}

