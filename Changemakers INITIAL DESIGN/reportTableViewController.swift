//
//  reportTableViewController.swift
//  Changemakers_Designer_View
//
//  Created by Ler Yan En on 7/7/18.
//  Copyright © 2018 KWJX. All rights reserved.
//

import UIKit
import SwiftChart
class reportTableViewController: UITableViewController{
    //"Sit-ups","Pull-ups","Sit and reach","Standing board jump","2.4 run","Shuttle-run"
    //all mocketest data
    var longrun = UserDefaults.standard.array(forKey: "2.4 run") as? [Int] ?? []
    var Situps = UserDefaults.standard.array(forKey: "Sit-ups") as? [Int] ?? []
    var Pullups = UserDefaults.standard.array(forKey: "Pull-ups") as? [Int] ?? []
    var Sitandreach = UserDefaults.standard.array(forKey: "Sit and reach") as? [Int] ?? []
    var Standingboardjump = UserDefaults.standard.array(forKey: "Standing board jump") as? [Int] ?? []
    var Shuttlerun = UserDefaults.standard.array(forKey: "Shuttle-run") as? [Int] ?? []
    
    
    @IBOutlet var score: UILabel!
    let user = UserDefaults.standard
    @IBOutlet weak var run: UIView!
    @IBOutlet var situp: UIView!
    @IBOutlet var pullup: UIView!
    @IBOutlet var sitandreachh: UIView!
    @IBOutlet var standingboardjump: UIView!
    @IBOutlet var shuttlerun: UIView!
    
    @IBOutlet var weight: UILabel!
    @IBOutlet var bmi: UILabel!
    @IBOutlet var height: UILabel!
    @IBOutlet var gender: UILabel!
    @IBOutlet var dateofbirth: UILabel!
   let arrry : [String] = ["Female","Male"]
    override func viewDidLoad() {
        super.viewDidLoad()
        var label = UILabel()
        
        print(Situps)
        // setup graphs
        //run
        var chart = Chart(frame:run.frame)
        var series = ChartSeries(longrun.map { Double($0) })
        chart.add(series)
        run.addSubview(chart)
        if(longrun.map { Double($0) } == []){
            label = UILabel(frame: run.frame)
            label.text = "No data to show"
            label.textColor = UIColor.gray
            label.textAlignment = .center
            run.addSubview(label)
            run.bringSubview(toFront: label)
            print(label)
        }
        //situp
        chart = Chart(frame:situp.frame)
        series = ChartSeries(Situps.map { Double($0) })
        chart.add(series)
        situp.addSubview(chart)
        if(Situps.map { Double($0) } == []){
            label = UILabel(frame: situp.frame)
            label.text = "No data to show"
            label.textColor = UIColor.gray
            label.textAlignment = .center
            situp.addSubview(label)
            situp.bringSubview(toFront: label)
        }
        //pullup
        chart = Chart(frame:pullup.frame)
        series = ChartSeries(Pullups.map { Double($0) })
        chart.add(series)
        pullup.addSubview(chart)
        if(Pullups.map { Double($0) } == []){
            label = UILabel(frame: pullup.frame)
            label.text = "No data to show"
            label.textColor = UIColor.gray
            label.textAlignment = .center
            pullup.addSubview(label)
            pullup.bringSubview(toFront: label)
        }
        //sitandreachh
        chart = Chart(frame:sitandreachh.frame)
        series = ChartSeries(Sitandreach.map { Double($0) })
        chart.add(series)
        sitandreachh.addSubview(chart)
        if(Sitandreach.map { Double($0) } == []){
            label = UILabel(frame: sitandreachh.frame)
            label.text = "No data to show"
            label.textColor = UIColor.gray
            label.textAlignment = .center
            sitandreachh.addSubview(label)
            sitandreachh.bringSubview(toFront: label)
        }
        //standingboardjump
        chart = Chart(frame:standingboardjump.frame)
        series = ChartSeries(Standingboardjump.map { Double($0) })
        chart.add(series)
       standingboardjump.addSubview(chart)
        print(Standingboardjump.map { Double($0) })
        if(Standingboardjump.map { Double($0) } == []){
            label = UILabel(frame: standingboardjump.frame)
            label.text = "No data to show"
            label.textColor = UIColor.gray
            label.textAlignment = .center
            standingboardjump.addSubview(label)
        }
        //shuttlerun
       
        chart = Chart(frame:shuttlerun.frame)
        series = ChartSeries(Shuttlerun.map { Double($0) })
        chart.add(series)
        shuttlerun.addSubview(chart)
         if(Shuttlerun.map { Double($0) } == []){
            label = UILabel(frame: shuttlerun.frame)
            label.text = "No data to show"
            label.textColor = UIColor.gray
            label.textAlignment = .center
            shuttlerun.addSubview(label)
        }
        if(Situps == [] || longrun == [] || Pullups == [] || Sitandreach == [] || Standingboardjump == [] || Shuttlerun == []){
            score.text = "Data not complete"
        }else{
            let totalscore = Situps.last! + longrun.last! + Pullups.last! + Sitandreach.last! + Standingboardjump.last! + Shuttlerun.last!
            score.text = String(totalscore)
        }
        
        
        
        if(userAlreadyExist(kUsernameKey: "weight") && userAlreadyExist(kUsernameKey: "height") && userAlreadyExist(kUsernameKey: "gender") && userAlreadyExist(kUsernameKey: "birth")){
            weight.text = weight.text! + " : " + String(user.double(forKey: "weight"))
            height.text = height.text! + " : " + String(user.double(forKey: "height"))
            gender.text = gender.text! + " : " + arrry[user.integer(forKey: "gender")]
            dateofbirth.text = dateofbirth.text! + user.string(forKey: "birth")!
            bmi.text = bmi.text! + " : " + String(user.double(forKey: "weight") / (user.double(forKey: "height") * user.double(forKey: "height")))
            
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "login")
            self.present(controller, animated: true, completion: nil)
        }
    }
    func userAlreadyExist(kUsernameKey: String) -> Bool {
        return UserDefaults.standard.object(forKey: kUsernameKey) != nil
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func reset(_ sender: Any) {
        user.removeObject(forKey: "2.4 run")
        user.removeObject(forKey: "Sit-ups")
        user.removeObject(forKey: "Pull-ups")
        user.removeObject(forKey: "Sit and reach")
        user.removeObject(forKey: "Standing board jump")
        user.removeObject(forKey: "Shuttle-run")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

