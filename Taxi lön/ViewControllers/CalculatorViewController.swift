//
//  CalculatorViewController.swift
//  Taxi lön
//
//  Created by Patrik Persson Avd 12 on 2018-02-18.
//  Copyright © 2018 Transportarbetareförbundet. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
   
    
    enum GuaranteeSalary: Double {
        case stockholmSalary = 19572.0
        case restOfSwedenSalary = 19211.0
        case guaranteeHours = 166.4
    
    }
    
    let callTransportText = NSLocalizedString("call_transport", comment: "")
    let infoLocationTitle = NSLocalizedString("info_location_title", comment: "")
    let infoLocationBody = NSLocalizedString("info_location_body", comment: "")

    let infoWorkedHoursTitle = NSLocalizedString("info_workedhours_title", comment: "")
    let infoWorkedHoursBody = NSLocalizedString("info_workedhours_body", comment: "")
    let infoCollectiveAgreementTitle = NSLocalizedString("info_collectiveagreement_title", comment: "")
    let infoCollectiveAgreementBody = NSLocalizedString("info_collectiveagreement_body", comment: "")
    let infoCollectiveAgreementRadioButton = NSLocalizedString("info_collectiveagreement_radio_title", comment: "")
   
   
     let alertSorry = NSLocalizedString("alert_sorry", comment: "")
     let alertSorryBody = NSLocalizedString("alert_sorry_body", comment: "")
    let alertPlaceMissingTitle = NSLocalizedString("place_missing_title", comment: "")
     let alertPlaceMissingBody = NSLocalizedString("place_missing_body", comment: "")
     let alertWorkedHoursTitle = NSLocalizedString("worked_hours_missing_title", comment: "")
     let alertWorkedHoursBody = NSLocalizedString("worked_hours_missing_title", comment: "")
    
    
    var passOnCalculatedSalary: Double = 0.0
    var passOnWorkedHours: Double = 0.0
    var hasCollectiveAgreement: Bool = true
    var calculateFromGuaranteeHours: Double = 0.0
    var workingAllDaysOfTheWeek = true
    
    let redColor = UIColor.red
    let lightGreyColor = UIColor.lightGray

    
    @IBOutlet weak var radioButtons: DLRadioButton!
    
    
  
    
    
    @IBOutlet weak var calculateButtonOutlet: UIButton!
    
    @IBOutlet weak var procentageOfFulltimeSlider: UISlider!
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var workedHourTextField: UITextField!
    
    @IBOutlet weak var radioButtonWeek: DLRadioButton!
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationTextField.delegate = self
        self.workedHourTextField.delegate = self
    
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        keyboardToolbar.setItems([flexibleSpace, doneButton], animated: false)
        
        locationTextField.inputAccessoryView = keyboardToolbar
      workedHourTextField.inputAccessoryView = keyboardToolbar
        
        // Do any additional setup after loading the view.
    }
    
    @objc func doneClicked(){
        view.endEditing(true)
    }
    
    
    // Hides keyboard when user touches outside of keyboard and when pressing return
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        locationTextField.resignFirstResponder()
        workedHourTextField.resignFirstResponder()
        
        return (true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
 
    
    
    //MARK: - Alert Dialog and alert dialog with call button
    func showAlertWith(title: String, message: String, style: UIAlertControllerStyle = .alert){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: dismissAlert)
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
 
    
    func showAlertWithCallButton(title: String, message: String, style: UIAlertControllerStyle = .alert){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: dismissAlert)
        
        let callAction = UIAlertAction(title: callTransportText, style: .default, handler: callTransport)
        
        alertController.addAction(okAction)
        alertController.addAction(callAction)
        
        
        if presentedViewController == nil {
            self.present(alertController, animated: true, completion: nil)
        } else{
            self.dismiss(animated: false) { () -> Void in
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
  
    func dismissAlert(sender: UIAlertAction) -> Void {
        
    }
    func callTransport(sender: UIAlertAction) -> Void{
      makeACallToTransport()
    }
    
    
    //MARK: - Make Call for Alert dialog with callbutton
    func makeACallToTransport()  {
        let url: NSURL = URL(string: "TEL://0104803000")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    
    
    
    
    //MARK: - Info buttons
    @IBAction func infoLocationButton() {
        showAlertWith(title: infoLocationTitle, message: infoLocationBody)
    }
    @IBAction func infoWorkedHoursButton() {
        showAlertWith(title: infoWorkedHoursTitle, message: infoWorkedHoursBody)
    }
    @IBAction func infoCollectiveAgreementButton() {
        showAlertWithCallButton(title: infoCollectiveAgreementTitle, message: infoCollectiveAgreementBody)
    }
    
   
    
    //MARK: - Radiobuttons actions & calculate button action
    @IBAction func radioButtonAction(_ sender: DLRadioButton) {
        if sender.tag == 1 {
            hasCollectiveAgreement = true
            calculateButtonOutlet.backgroundColor = UIColor(displayP3Red: 250/255, green: 209/255, blue: 0/255, alpha: 1.0)
            
        }else{
            hasCollectiveAgreement = false
            calculateButtonOutlet.backgroundColor = UIColor(displayP3Red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
            showAlertWithCallButton(title: infoCollectiveAgreementRadioButton, message: infoCollectiveAgreementBody)
            
        }
    }
   
    
   
    
    
  
    
    @IBAction func calculateButton(_ sender: Any) {
     
        
        if (workedHourTextField.text?.isEmpty)! && (locationTextField.text?.isEmpty)!{
           changeTextField(textField: locationTextField, borderWidth: 1, borderColor: redColor)
           changeTextField(textField: workedHourTextField, borderWidth: 1, borderColor: redColor)
            showAlertWith(title: alertSorry, message: alertSorryBody)
           
        } else if (locationTextField.text?.isEmpty)! {
           changeTextField(textField: locationTextField, borderWidth: 1, borderColor: redColor)
            
            showAlertWith(title: alertPlaceMissingTitle, message: alertPlaceMissingBody)
        } else if (workedHourTextField.text?.isEmpty)! {
           changeTextField(textField: workedHourTextField, borderWidth: 1, borderColor: redColor)
            
        showAlertWith(title: alertWorkedHoursTitle, message: alertWorkedHoursBody)
        }else {
            getValuesAndSegue()
            
        }
        
        
        
       
    }
   
    
    func getValuesAndSegue() {
        
       
            calculateFromGuaranteeHours = GuaranteeSalary.guaranteeHours.rawValue
        
        
        
        if hasCollectiveAgreement == true{
            passOnCalculatedSalary =  calculateSalaryBy(location:  locationFrom(textField: locationTextField.text), hours: hoursFrom(textField: workedHourTextField.text), guaranteeHours: calculateFromGuaranteeHours)
            if (workedHourTextField.text?.isEmpty)!  {
                passOnWorkedHours = calculateFromGuaranteeHours
            }else {
                passOnWorkedHours = hoursFrom(textField: workedHourTextField.text)
            }
            
            performSegue(withIdentifier: "showResult", sender: self)
            
        }else {
            showAlertWith(title: "Error", message: "Error")
        }
        
    }
  
    
    
    func calculateSalaryBy(location: Double, hours: Double, guaranteeHours: Double) -> Double{
        var workedHours: Double
        let returnSalary: Double
       
        
        
        
        if hours <= guaranteeHours {
            returnSalary = location
            
        
        }else {
            workedHours = hours
            returnSalary = location / guaranteeHours * workedHours
        }
            return returnSalary
        }
    
    
    
    func locationFrom(textField: String?) -> Double{
    
            var locationSalary: Double
    
            let location = textField?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines).trimmingCharacters(in: .punctuationCharacters)
    
            var locationStockholmIsTrue: Bool
            switch location{
            case "sthlm"?:
                locationStockholmIsTrue = true
            case "stockholm"?:
                locationStockholmIsTrue = true
            case "stokholm"?:
                locationStockholmIsTrue = true
            case "stocholm"?:
                locationStockholmIsTrue = true
            default:
                locationStockholmIsTrue = false
            }
    
            if locationStockholmIsTrue == true {
                locationSalary = GuaranteeSalary.stockholmSalary.rawValue
            }else{
                locationSalary = GuaranteeSalary.restOfSwedenSalary.rawValue
            }
    
            return locationSalary
        }
    
    
    func hoursFrom(textField: String?) -> Double{
        
        var workedHours: Double
        
        let hoursFrom = textField?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines).trimmingCharacters(in: .punctuationCharacters)
        let convertToDouble = NSString(string : hoursFrom!).doubleValue
        workedHours = convertToDouble
        
        return workedHours
    }

    
    //MARK: - Inputfields
    
    @IBOutlet weak var procentageOfFulltimeLabel: UILabel!
    
    @IBAction func procentageOfFulltimeSlider(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        procentageOfFulltimeLabel.text = "\(currentValue)%"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let showResult = segue.destination as! ShowCalculatedSalaryViewController
        
        showResult.passedCalculatedSalary = passOnCalculatedSalary
        showResult.passedWorkedHours = passOnWorkedHours
        
        
        
    }
    
    
    func changeTextField(textField: UITextField, borderWidth: CGFloat, borderColor: UIColor){
        textField.layer.borderWidth = borderWidth
        textField.layer.borderColor = borderColor.cgColor
        
    }
    
    @IBAction func locationChanged(_ sender: Any) {
        
          changeTextField(textField: locationTextField, borderWidth: 0, borderColor: lightGreyColor)
    }
  
    @IBAction func workedHoursChanged(_ sender: Any) {
        changeTextField(textField: workedHourTextField, borderWidth: 0, borderColor: lightGreyColor)
    }
    
    
 
}
