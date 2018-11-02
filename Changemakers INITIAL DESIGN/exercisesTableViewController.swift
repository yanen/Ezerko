//
//  exercisesTableViewController.swift
//  Changemakers_Designer_View
//
//  Created by Ler Yan En on 7/7/18.
//  Copyright © 2018 KWJX. All rights reserved.
//

import UIKit

class exercisesTableViewController: UITableViewController {
    var data = UserDefaults.standard
    

     var nafa : [String:[exercises]] =
        [
            "onesitup":
                [exercises(title: "Forward Plank",discription: "The most popular form of planking, targeting the core muscles that surround the trunk; the abdominal muscles and spinal muscles."),exercises(title: "Side Plank",discription: "A variation of the standard planking, that works your core more."),exercises(title: "Cobra Stretch", discription:"The Cobra pose helps to stretch your abdominal muscles and strengthen your lower back muscles."),exercises(title: "Crunch", discription:"CCrunches mainly work the muscles midsection of your body and is an effective way to strengthen your torso and core region of your body."),exercises(title: "Arm and Leg Raise", discription:"This exercise works the muscles of your low back, butt (glutes), rear thighs (hamstrings), rear deltoid, and neck. "),exercises(title: "Ballet Twist", discription:"Ballet twist is a simple stetch that engages your core muscles, as well as balance."),exercises(title: "Bicycle Crunch", discription:"Bicycle crunch mainly works your lower abs, middle abs and rectus abdominis muscle (upper abs).")
            ],
            "twopullup":
                [exercises(title: "Push-up",discription: "A very common strength training exercise that is mostly used to strengthen the arm muscles."),exercises(title: "Diamond Push-up",discription: "A much harder variation of the standard pushup, targeting more on your triceps.")
            ],
            "threesitandreach":
                [exercises(title: "Butterfly Kick",discription: "Butterfly Kick works on the mid and lower abs, glutes, hip flexors, quads, and adductors."),exercises(title: "Leg Lift",discription: "A strength training exercise which targets the interior hip flexors, the rectus abdominis muscle and the internal and external oblique muscles.")
            ],
            "fourboardjump":
                [exercises(title: "Counter-movement Jump",discription: "The countermovement jump is a very reliable measure of lower-body power."),exercises(title: "Star Jump",discription: "Star jumps strengthen your deltoids, the trapezius muscles and work all your major leg muscles."),exercises(title: "Jumping jack", discription:"A dynamic full-body exercise that is a popular warm-up excerise that increases body temperature, aerobic capacity, and strength."),exercises(title: "Tuck Jump", discription:"Tuck Jumps works the core section, primarily the rectus abdominis, transverse abdominis and the lower body.")
            ],
            "fiverun":
            [exercises(title: "Butt Kicks", discription:"Butt kicks mainly strengthens the knee flexors and the hip extensors."),exercises(title: "Mountain climber", discription:"An compound exercise which works several joints and muscle groups simultaneously, naming your glute and leg muscles."),exercises(title: "High Knee", discription:"High Knee develops strength and endurance of the hip flexors, hip extenders and the quads.")
            ],
            "sixshuttlerun":
                [exercises(title: "Lunges",discription: "A classic fitness exercisewhich mainly helps the lower body and the flexibility of the hips and hamstrings."),exercises(title: "Squats",discription: "The squat is a compound, full body exercise that trains primarily the muscles of the lower body.")
            ]
]
    var images:[UIImage] = [#imageLiteral(resourceName: "Sit-up.jpeg"),#imageLiteral(resourceName: "pull-up.jpeg"),#imageLiteral(resourceName: "Sit and reach.jpeg"),#imageLiteral(resourceName: "Standingboardjump.jpeg"),#imageLiteral(resourceName: "Running.jpeg"),#imageLiteral(resourceName: "Shuttle run.jpeg")]
    var stuff:[String] = ["Sit-ups","Pull-ups","Sit and reach","Standing broad jump","2.4 km run","Shuttle-run"]
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.canCancelContentTouches = true
self.tableView.rowHeight = 150;
        image.image = images[UserDefaults.standard.integer(forKey: "napha") - 1]
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        let birthday: Date = dateFormatter.date(from: UserDefaults.standard.string(forKey: "birth")!)!
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        let age = ageComponents.year!
        if(age < 15 && UserDefaults.standard.integer(forKey: "gender") == 0){
            stuff[1] = "Inclined pull up"
            self.title = "Inclined pull up"
        }
        self.title = stuff[UserDefaults.standard.integer(forKey: "napha") - 1]
        let infoButton = UIButton(type: .infoLight)
        infoButton.addTarget(self, action: #selector(getinfoaction), for: .touchUpInside)
        
        let infoBarButtonItem = UIBarButtonItem(customView: infoButton)
        navigationItem.rightBarButtonItem = infoBarButtonItem
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func mocktest(_ sender: Any) {
        let alert = UIAlertController(title: self.title, message: "Enter your points for the following sections", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
            textField.placeholder = "Points(Integer,0-5)"
            textField.keyboardType = .numberPad
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            print("\(String(describing: textField?.text))")
            if(String(describing: textField?.text) != "" && Int((textField?.text)!) != nil && Int((textField?.text)!)! < 6 && Int((textField?.text)!)! >= 0 ){
                var intArray = UserDefaults.standard.array(forKey: self.title!) as? [Int] ?? []
                intArray.append(Int((textField?.text)!)!)
                UserDefaults.standard.set(intArray, forKey: self.title!)
                let alert2 = UIAlertController(title: "SUCESS!!", message: "Date is sucessfully stored and can be viewed in the report page", preferredStyle: .alert)
                
                alert2.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    self.navigationController?.popToRootViewController(animated: true)
                }))
                self.present(alert2, animated: true, completion: nil)
            }else{
                self.presentAlert(withTitle: "Error", message: "Bad input,try again")
            }
        
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    @objc func getinfoaction() {
        self.performSegue(withIdentifier: "info", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch UserDefaults.standard.integer(forKey: "napha"){
        case 1:return (nafa["onesitup"]?.count)! + 1
        case 2:return (nafa["twopullup"]?.count)! + 1
        case 3:return (nafa["threesitandreach"]?.count)! + 1
        case 4:return (nafa["fourboardjump"]?.count)! + 1
        case 5:return (nafa["fiverun"]?.count)! + 1
        case 6:return (nafa["sixshuttlerun"]?.count)! + 1
        default:return 0
        }
    }
    struct exercises: Decodable{
        var title:String
        var discription:String
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch UserDefaults.standard.integer(forKey: "napha"){
        case 1:
            UserDefaults.standard.set(nafa["onesitup"]?[indexPath.row-1].title, forKey: "String")
        case 2:
            UserDefaults.standard.set(nafa["twopullup"]?[indexPath.row-1].title, forKey: "String")
        case 3:
            UserDefaults.standard.set(nafa["threesitandreach"]?[indexPath.row-1].title, forKey: "String")
        case 4:
            UserDefaults.standard.set(nafa["fourboardjump"]?[indexPath.row-1].title, forKey: "String")
        case 5:
            UserDefaults.standard.set(nafa["fiverun"]?[indexPath.row-1].title, forKey: "String")
        case 6:
            UserDefaults.standard.set(nafa["sixshuttlerun"]?[indexPath.row-1].title, forKey: "String")
            
        default: print("error")
        }
        self.performSegue(withIdentifier: "Show", sender: nil)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
        let cell = tableView.dequeueReusableCell(withIdentifier: "identi2", for: indexPath)
            let image = cell.viewWithTag(1) as! UIImageView
            let now = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.medium
            dateFormatter.timeStyle = DateFormatter.Style.none
            let birthday: Date = dateFormatter.date(from: UserDefaults.standard.string(forKey: "birth")!)!
            let calendar = Calendar.current
            let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
            let age = ageComponents.year!
            if(age < 15 || UserDefaults.standard.integer(forKey: "gender") == 0){
                stuff[1] = "Inclined pull up"
            }
            print("MALE," + stuff[UserDefaults.standard.integer(forKey: "napha") - 1])
            if(UserDefaults.standard.integer(forKey: "gender") == 1){
                image.image = UIImage(named:"MALE," + stuff[UserDefaults.standard.integer(forKey: "napha") - 1])
            }else{
                print("FEMALE," + stuff[UserDefaults.standard.integer(forKey: "napha") - 1])
                image.image = UIImage(named:"FEMALE," + stuff[UserDefaults.standard.integer(forKey: "napha") - 1])
            }
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "identi", for: indexPath)
        let name = cell.viewWithTag(1) as! UILabel
        let decrip = cell.viewWithTag(2) as! UITextView
        
        switch UserDefaults.standard.integer(forKey: "napha"){
        case 1:
            name.text = nafa["onesitup"]?[indexPath.row-1].title
            decrip.text = nafa["onesitup"]?[indexPath.row-1].discription
        case 2:
            name.text = nafa["twopullup"]?[indexPath.row-1].title
            decrip.text = nafa["twopullup"]?[indexPath.row-1].discription
        case 3:
            name.text = nafa["threesitandreach"]?[indexPath.row-1].title
            decrip.text = nafa["threesitandreach"]?[indexPath.row-1].discription
        case 4:
            name.text = nafa["fourboardjump"]?[indexPath.row-1].title
            decrip.text = nafa["fourboardjump"]?[indexPath.row-1].discription
        case 5:
            name.text = nafa["fiverun"]?[indexPath.row-1].title
            decrip.text = nafa["fiverun"]?[indexPath.row-1].discription
        case 6:
            name.text = nafa["sixshuttlerun"]?[indexPath.row-1].title
            decrip.text = nafa["sixshuttlerun"]?[indexPath.row-1].discription
            
        default: print("error")
            }
        
        
return cell
        
        }        // Configure the cell...

        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        let birthday: Date = dateFormatter.date(from: UserDefaults.standard.string(forKey: "birth")!)!
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        let age = ageComponents.year!
        if indexPath.row == 0 {
            if(age < 15 || UserDefaults.standard.integer(forKey: "gender") == 0 || self.title == "Inclined pull up"){
              return 180
            }
            return 150
        } else {
            return 150
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
class sectioninfo: UIViewController {
    @IBOutlet var info: UITextView!
    var array:[String:String] = ["2.4 km run":"1.6km / 2.4km run Description: The 1.6/2.4km run is a test on your stamina. In order to ace this component, you need to have good stamina and think well. If you are too tired, do not force yourself to run even more. You can walk for a while and continue running. In this 1.6km/2.4 km run, you will be tested based on your timing for your run.","Sit-ups":"Sit-ups Description: The NAPFA test for Sit ups aim at doing the most number of sit ups in one minute as a test of your core muscles and strength.//WARNING: Full sit-ups may cause back pain and arching of the lower back, increasing the risk of back injury. If you have a backache, please do not do sit-ups to prevent the aggravation of the injury.//Tips://1. Lie face up, with knees bent. Your feet should be placed shoulder width apart.//2. The angle of your knees should be at least 90 degrees while a partner firmly holds your ankle.//3. With hands cupping your ears, curl upwards towards your knee.//4. Return to the starting position, making contact with the mat with your shoulders.//5. One Sit up is counted when the elbows touch the knees. Repeat doing as many sit-ups as possible within 90 seconds.","Pull-ups":"Incline Pull-up / Pull-up Description: The pull ups is a test of your upper limb muscular endurance and strength.. In the NAPFA test, you will be tested based on the number of Inclined pull ups you do in half a minute (30 seconds). //Tips://1. Face the thin rod. Hold the thicker part of the bar and suspend yourself in the air.//2. Make sure only your heel is touching the mat.//3. Pull youself up till your chin goes over the thinner rod.//4. Release your arms fully before the next attempt. Do as many as possible in 30 seconds.","Shuttle-run":"Shuttle Run Description: The shuttle run is a test of your speed and agility. In your NAPFA test, the faster of the 2 attempts to complete the 4 x 10 m shuttle run will be counted. //Tips://1. Stand with your toes behind the starting line, facing the bean-bags/blocks.//2. Get ready, leaning your body forward and placing your stronger leg upfront.//3. On command, run across to pick up the bean bag/block.//4. Tip. When nearing the bean bag/block, reach your leg forward (Like a lunge) and reach out to grab the block/bean bag. Twist your leg and continue.//5. Return to place the block/bean bag behind the starting line.//6. Repeat //7. When in your last lap, do not slow down near the starting line as it may affect your timing. Run all the way forward instead.","Sit and reach":"Sit and Reach Description: The sit and reach test is a measure of flexibility, and specifically measures the flexibility of the lower back and hamstring muscles. //Tips: //1. Keep your back and shoulders straight, with your arms reaching forward.//2. Take a deep breath//3. As you breathe out, push both your arms forward, pushing the bar forward.//4. Remember to stretch before and after the exercise","Standing broad jump":"Standing Broad Jump Description: The standing broad jump is a test of your lower limb extensor muscular power. The better of your 2 consecutive standing broad jumps distances will be counted.//Tips: //1. Stand just before the line//2. Get your arms in front of you and be ready.//3. Bend your knees and swing your arms as far back as possible.//4. Coordinate your forward arm swing with your forward jump.//5. Land with both feet and knees bending. Remain stationary until the measurement is taken."]
    var stuff:[String] = ["Sit-ups","Pull-ups","Sit and reach","Standing broad jump","2.4 km run","Shuttle-run"]
    override func viewDidLoad() {
        
        info.text = array[stuff[UserDefaults.standard.integer(forKey: "napha") - 1]]?.replacingOccurrences(of: "//", with: "\n")
    }
}
