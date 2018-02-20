//
//  ShowCalculatedSalaryViewController.swift
//  Taxi lön
//
//  Created by Patrik Persson avd 12 on 2018-02-19.
//  Copyright © 2018 Transportarbetareförbundet. All rights reserved.
//

import UIKit


class ShowCalculatedSalaryViewController: UIViewController {
    
   var passedCalculatedSalary = Double()
    var passedWorkedHours = Double()
    @IBOutlet weak var calculatedSalary: UILabel!
    
    @IBOutlet weak var calculatedSalaryWithVaccationPay: UILabel!
    
    @IBOutlet weak var hourlyWageLabel: UILabel!
  
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let intSalary = Int(passedCalculatedSalary)
        let vaccationPay = passedCalculatedSalary * 1.13
        let intVaccation = Int(vaccationPay)
        let readableSalary = intSalary.formattedWithSeparator
        let readableSalaryWithVaccationPay = intVaccation.formattedWithSeparator
        
        let intHours = Int(passedWorkedHours)
        
        
        let hourlyWage = intSalary / intHours
        let readableHourlyWage = hourlyWage.formattedWithSeparator
        calculatedSalary.text = "\(readableSalary) kr"
        calculatedSalaryWithVaccationPay.text = "\(readableSalaryWithVaccationPay) kr"
        hourlyWageLabel.text = "\(readableHourlyWage) kr/h"

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





