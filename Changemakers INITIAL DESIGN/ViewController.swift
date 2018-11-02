//
//  ViewController.swift
//  Changemakers INITIAL DESIGN
//
//  Created by Kieran Wong Jiing Xun on 27/6/18.
//  Copyright © 2018 KWJX. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet var BIRTH: UITextField!
    @IBOutlet var height: UITextField!
    @IBOutlet var gender: UISegmentedControl!
    
    @IBOutlet var weight: UITextField!
    @IBAction func submit(_ sender: Any) {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = 1995
        let newDate = calendar.date(from: components)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        let date = Date()
        let user = UserDefaults.standard
        if(BIRTH.text != "" && height.text != "" && weight.text != "" && dateFormatter.date(from: BIRTH.text!) != nil){
            if (dateFormatter.date(from: BIRTH.text!)! > date || dateFormatter.date(from: BIRTH.text!)! < newDate! || Double(height.text!)! > 2.9 || Double(height.text!)! < 1  || Double(weight.text!)! > 422 || Double(weight.text!)! < 5 ){
            print("You are not human")
                presentAlert(withTitle: "Invalid", message: "Invalid data,you are not human")
            }else if(Double(height.text!) != nil && Double(weight.text!) != nil ){
                
                user.set(BIRTH.text!, forKey: "birth")
                user.set(Double(height.text!)!, forKey: "height")
                user.set(Double(weight.text!)!, forKey: "weight")
                user.set(gender.selectedSegmentIndex, forKey: "gender")
                self.performSegue(withIdentifier: "show", sender: nil)
            }else{
                 user.set(BIRTH.text!, forKey: "birth")
                user.set(gender.selectedSegmentIndex, forKey: "gender")
                self.performSegue(withIdentifier: "show", sender: nil)
            }
            
        }else{
            print("Invalid data")
            presentAlert(withTitle: "Invalid", message: "Invalid data")
        }
    }
    @IBAction func BIRTHDAY(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(ViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        BIRTH.text = dateFormatter.string(from: sender.date)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        BIRTH.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(ViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
        
        // Do any additional setup after loading the view, typically from a nib.
    @IBAction func btns(_ sender: UIButton) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension UIViewController {
    
    func presentAlert(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            print("You've pressed OK Button")
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

