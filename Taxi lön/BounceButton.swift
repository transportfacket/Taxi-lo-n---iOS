//
//  BounceButton.swift
//  Taxi lön
//
//  Created by Transport on 2018-02-20.
//  Copyright © 2018 Transportarbetareförbundet. All rights reserved.
//

import UIKit


class BounceButton: UIButton {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 25, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity

            }, completion: nil)
        
        super.touchesBegan(touches, with: event)
        
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
