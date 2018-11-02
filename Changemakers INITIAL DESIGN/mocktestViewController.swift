//
//  mocktestViewController.swift
//  Changemakers_Designer_View
//
//  Created by Ler Yan En on 17/7/18.
//  Copyright © 2018 KWJX. All rights reserved.
//

import UIKit
import AVFoundation

class credits: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        playFullScreenVideo()
        // Do any additional setup after loading the view.
    }
   
    private func playFullScreenVideo() {
        // drag your video file in  project
        // check if video file is available,if not return
        guard let path = Bundle.main.path(forResource: "movie", ofType:"mp4") else {
            debugPrint("video.mp4 missing")
            return
        }
        // create instance of videoPlayer with video path
         let videoPlayer = AVPlayer(url: URL(fileURLWithPath: path))
        NotificationCenter.default.addObserver(self, selector: #selector(self.playerDidFinishPlaying(sender:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: videoPlayer.currentItem)
        // create instance of playerlayer with videoPlayer
        let playerLayer = AVPlayerLayer(player: videoPlayer)
        // set its videoGravity to AVLayerVideoGravityResizeAspectFill to make it full size
        self.view.layer.addSublayer(playerLayer)
        playerLayer.frame = self.view.layer.bounds
        playerLayer.videoGravity = AVLayerVideoGravity.resize 
        // start playing video
        self.view.bringSubview(toFront: back)
        videoPlayer.play()
    }
    @IBOutlet var back: UIButton!
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func playerDidFinishPlaying(sender: Notification) {
        print("Video Finished")
        self.navigationController?.popToRootViewController(animated: true)
        // Do Something
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.isNavigationBarHidden = false
    }
    
}
//class shuttlerun: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view.
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        // Hide the navigation bar on the this view controller
//        self.navigationController?.isNavigationBarHidden = true
//        
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        // Show the navigation bar on other view controllers
//        self.navigationController?.isNavigationBarHidden = false
//    }
//    
//}
//class run: UIViewController,UITableViewDelegate,UITableViewDataSource{
//    var stuff: [data] = []
//    
//    var counter = 0.0
//    var lap = 0
//    var timer = Timer()
//    var secondtime = 0
//    struct data{
//        var lap:Int
//        var time:String
//    }
//    var ispaused = false
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        // Hide the navigation bar on the this view controller
//        self.navigationController?.isNavigationBarHidden = true
//        
//        
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return stuff.count
//    }
//    @IBAction func pause(_ sender: Any) {
//        if(ispaused == true){
//          ispaused = false
//        }else{
//            ispaused = true
//        }
//        
//        
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
//        let lap = cell.viewWithTag(1) as? UILabel
//        let time = cell.viewWithTag(2) as? UILabel
//        lap?.text = "Lap: " + String(stuff[indexPath.row].lap)
//        time?.text =  "Time: " + stuff[indexPath.row].time
//        return cell
//    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    @IBOutlet var stopwatch: UILabel!
//    
//    @IBAction func reset(_ sender: Any) {
//        stuff = []
//        counter = 0.0
//        lap = 0
//        secondtime = 0
//        ispaused = false
//        tabel.reloadData()
//    }
//    
//    @IBAction func done(_ sender: Any) {
//        print("done")
//        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Result")
//        // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
//        
//        self.present(viewController, animated: true, completion: nil)
//    }
//    
//    @objc func UpdateTimer() {
//        if(ispaused == true){
//            return
//        }
//        counter = counter + 0.1
//        stopwatch.text = String(secondsToHoursMinutesSeconds(seconds:Int(counter)))
//    }
//    @IBOutlet var second: UILabel!
//    @objc func Timer1() {
//        if(ispaused == true){
//            return
//        }
//        if(secondtime == 99){
//            secondtime = 0
//            second.text = String(format: "%02d", secondtime)
//        }else{
//        secondtime = secondtime + 1
//        second.text = String(format: "%02d", secondtime)
//        }
//    }
//    @IBOutlet var tabel: UITableView!
//    func secondsToHoursMinutesSeconds (seconds : Int) -> (String) {
//        let minute = (seconds % 3600) / 60
//        let second = (seconds % 3600) % 60
//        let minute1 = String(format: "%02d", minute)
//        let second2 = String(format: "%02d", second)
//        return minute1 + ":" + second2
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tabel.dataSource = self
//        tabel.delegate = self
//        stopwatch.text = String(counter)
//        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
//        RunLoop.current.add(timer, forMode: .commonModes)
//        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Timer1), userInfo: nil, repeats: true)
//        RunLoop.current.add(timer, forMode: .commonModes)
//       
//        // Do any additional setup after loading the view.
//    }
//    @IBAction func lap(_ sender: Any) {
//        if(ispaused == true){
//            return
//        }
//        if(counter >= 60){
//            storyboard?.instantiateViewController(withIdentifier: "Result")
//           return
//        }
//        if(lap < 30){
//        lap = lap + 1
//            stuff.append(data(lap: lap, time: stopwatch.text! + ":" + String(secondtime)))
//            tabel.reloadData()
//            let lastRowIndex = tabel.numberOfRows(inSection: 0) - 1
//            let pathToLastRow = IndexPath.init(row: lastRowIndex, section: 0)
//            tabel.scrollToRow(at: pathToLastRow, at: .none, animated: false)
//       
//        
//    }
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        // Show the navigation bar on other view controllers
//        self.navigationController?.isNavigationBarHidden = false
//    }
//    
//}
//class sitandreach: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view.
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        // Hide the navigation bar on the this view controller
//        self.navigationController?.isNavigationBarHidden = true
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        // Show the navigation bar on other view controllers
//        self.navigationController?.isNavigationBarHidden = false
//    }
//    
//}
//class sandingboardjump: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view.
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        // Hide the navigation bar on the this view controller
//        self.navigationController?.isNavigationBarHidden = true
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        // Show the navigation bar on other view controllers
//        self.navigationController?.isNavigationBarHidden = false
//    }
//    
//}
//class k: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view.
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        // Hide the navigation bar on the this view controller
//        self.navigationController?.isNavigationBarHidden = true
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        // Show the navigation bar on other view controllers
//        self.navigationController?.isNavigationBarHidden = false
//    }
//    
//}
//class result: UIViewController {
//    @IBAction func ok(_ sender: Any) {
//        navigationController?.popToRootViewController(animated: true)
//        
//    }
//    
//    @IBOutlet var resultlbl: UILabel!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let now = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = DateFormatter.Style.medium
//        dateFormatter.timeStyle = DateFormatter.Style.none
//        let birthday: Date = dateFormatter.date(from: UserDefaults.standard.string(forKey: "birth")!)!
//        let calendar = Calendar.current
//        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
//        let age = ageComponents.year!
//        var result = 0.0
//        switch UserDefaults.standard.integer(forKey: "napha"){
//        case 1:
//            //situp
//            switch age{
//            case 12:
//                if(result > 41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result >= 36 && result <= 41){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result >= 32 && result <= 35){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result >= 27 && result <= 31){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result >= 22 && result <= 26){
//                    //e
//                    resultlbl.text = "E"
//                }else{
//                    resultlbl.text = "Fail"
//                }
//            case 13:
//                if(result > 42){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result >= 38 && result <= 42){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result >= 34 && result <= 37){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result >= 29 && result <= 33){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result >= 25 && result <= 28){
//                    //e
//                    resultlbl.text = "E"
//                }else{
//                    resultlbl.text = "Fail"
//                }
//            case 14:
//                if(result < 42){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result >= 40 && result <= 42){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result >= 37 && result <= 39){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result >= 33 && result <= 36){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result >= 29 && result <= 32){
//                    //e
//                    resultlbl.text = "E"
//                }else{
//                    resultlbl.text = "Fail"
//                }
//            case 15:
//                if(result < 42){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result >= 40 && result <= 42){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result >= 37 && result <= 39){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result >= 33 && result <= 36){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result >= 29 && result <= 32){
//                    //e
//                    resultlbl.text = "E"
//                }else{
//                    resultlbl.text = "Fail"
//                }
//            case 16:
//                if(result < 42){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result >= 40 && result <= 42){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result >= 37 && result <= 39){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result >= 33 && result <= 36){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result >= 29 && result <= 32){
//                    //e
//                    resultlbl.text = "E"
//                }else{
//                    resultlbl.text = "Fail"
//                }
//            case 17:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 18:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//                
//            default:print("error")
//            }
//        case 2:
//            //pull up
//            switch age{
//            case 12:
//                if(result < 24){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result >= 21 && result <= 24){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result >= 16 && result <= 20){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result >= 11 && result <= 15){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result >= 5 && result <= 10){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 13:
//                if(result < 25){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result >= 22 && result <= 25){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result >= 17 && result <= 21){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result >= 12 && result <= 16){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result >= 7 && result <= 11){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 14:
//                if(result < 26){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result >= 23 && result <= 26){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result >= 18 && result <= 22){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result >= 13 && result <= 17){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result >= 18 && result <= 12){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 15:
//                if(result < 7){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result >= 6 && result <= 7){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result == 5){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result >= 3 && result <= 4){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result >= 1 && result <= 2){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 16:
//                if(result < 8){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result >= 7 && result <= 8){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result >= 5 && result <= 6){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result >= 3 && result <= 4){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result >= 1 && result <= 2){
//                    //e
//                    resultlbl.text = "E"
//                }else{
//                    resultlbl.text = "F"
//                }
//            case 17:
//                if(result < 9){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result >= 8 && result <= 9){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result >= 6 && result <= 7){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result >= 4 && result <= 5){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result >= 2 && result <= 3){
//                    //e
//                    resultlbl.text = "E"
//                }else{
//                    resultlbl.text = "F"
//                }
//            case 18:
//                if(result < 10){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result >= 9 && result <= 10){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result >= 7 && result <= 8){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result >= 5 && result <= 6){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result >= 3 && result <= 4){
//                    //e
//                    resultlbl.text = "E"
//                }else{
//                    resultlbl.text = "F"
//                }
//                
//            default:print("error")
//            }
//        case 3:
//            //sit and reach
//            switch age{
//            case 12:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }else{
//                    resultlbl.text = "F"
//                }
//            case 13:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }else{
//                    resultlbl.text = "F"
//                }
//            case 14:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }else{
//                    resultlbl.text = "F"
//                }
//            case 15:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }else{
//                    resultlbl.text = "F"
//                }
//            case 16:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 17:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 18:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//                
//            default:print("error")
//            }
//        case 4:
//            //board jump
//            switch age{
//            case 12:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 13:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 14:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 15:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 16:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 17:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 18:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//                
//            default:print("error")
//            }
//        case 5:
//            //run
//            switch age{
//            case 12:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 13:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 14:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 15:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 16:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 17:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 18:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//                
//            default:print("error")
//            }
//        case 6:
//            //shuttle run
//            switch age{
//            case 12:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 13:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 14:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 15:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 16:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 17:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//            case 18:
//                if(result < 10.41){
//                    //a
//                    resultlbl.text = "A"
//                }else if(result > 10.41 && result < 11.40){
//                    //b
//                    resultlbl.text = "B"
//                }else if(result > 11.41 && result < 12.40){
//                    //c
//                    resultlbl.text = "C"
//                }else if(result > 12.41 && result < 13.40){
//                    //d
//                    resultlbl.text = "D"
//                }else if(result > 13.41 && result < 14.40){
//                    //e
//                    resultlbl.text = "E"
//                }
//                
//            default:print("error")
//            }
//            
//        default: print("error")
//        }
//        // Do any additional setup after loading the view.
//    }
//
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        // Hide the navigation bar on the this view controller
//        self.navigationController?.isNavigationBarHidden = true
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        // Show the navigation bar on other view controllers
//        self.navigationController?.isNavigationBarHidden = false
//    }
//    
//}
//
//
