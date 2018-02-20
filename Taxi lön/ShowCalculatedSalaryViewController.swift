//
//  ShowCalculatedSalaryViewController.swift
//  Taxi lön
//
//  Created by Transport on 2018-02-19.
//  Copyright © 2018 Transportarbetareförbundet. All rights reserved.
//

import UIKit

class ShowCalculatedSalaryViewController: UIViewController {
    
   var passedCalculatedSalary = Double()
    var passedWorkedHours = Double()
    @IBOutlet weak var calculatedSalary: UILabel!
    
    @IBOutlet weak var calculatedSalaryWithVaccationPay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatedSalary.text = "\(round(passedCalculatedSalary)) kr"
        calculatedSalaryWithVaccationPay.text = "\(round(passedCalculatedSalary * 1.13)) kr"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButton(_ sender: Any) {
        
       
            dismiss(animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
