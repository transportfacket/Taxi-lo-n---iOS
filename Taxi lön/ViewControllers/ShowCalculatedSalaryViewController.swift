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
 
    
 
    

  
   
    
    @IBOutlet var resultView: UIView!
    
    @IBOutlet weak var calculatedSalary: UILabel!
    
    @IBOutlet weak var calculatedSalaryWithVaccationPay: UILabel!
    
    @IBOutlet weak var vaccationPayLabel: UILabel!
    
    
    @IBOutlet weak var hourlyWageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          navigationController?.setNavigationBarHidden(true, animated: false)
        let intSalary = Int(passedCalculatedSalary)
        let vaccationPay = passedCalculatedSalary * 1.13
        let intVaccation = Int(vaccationPay)
        
        let vaccationPayWithoutSalary = passedCalculatedSalary * 0.13
        let intVaccationWithout = Int(vaccationPayWithoutSalary)
        let readableSalary = intSalary.formattedWithSeparator
        let readableSalaryWithVaccationPay = intVaccation.formattedWithSeparator
        let readableVaccationPay = intVaccationWithout.formattedWithSeparator
        let intHours = Int(passedWorkedHours)
        
        
        let hourlyWage = intSalary / intHours
        let readableHourlyWage = hourlyWage.formattedWithSeparator
        calculatedSalary.text = "\(readableSalary) kr"
        calculatedSalaryWithVaccationPay.text = "\(readableSalaryWithVaccationPay) kr"
        hourlyWageLabel.text = "\(readableHourlyWage) kr/h"
        vaccationPayLabel.text = "\(readableVaccationPay) kr"
        
    
     
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





