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

   

    var tapCount = 0
    var bombSoundEffect: AVAudioPlayer?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

