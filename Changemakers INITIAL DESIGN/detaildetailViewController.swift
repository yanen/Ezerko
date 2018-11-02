//
//  detaildetailViewController.swift
//  Changemakers_Designer_View
//
//  Created by Ler Yan En on 2/8/18.
//  Copyright © 2018 KWJX. All rights reserved.
//

import UIKit

class detaildetailViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    @IBOutlet var text: UITextView!
    var nuuuu : [String : exercises1] = [
        "High Knee" : exercises1(description: "Develops strength and endurance of the hip flexors, the muscles that lift the knees and prevent plodding in the running stride. Develops strength and endurance of the quads. Stretches the hip extensors, which include the gluteal muscles. These benefits lead to a longer stride for faster, more efficient running.", steps: "1. Stand up straight and place your feet about hip-width apart.//2. Place your hands and palms down facing the floor, hovering just above your belly button.//3. Quickly, drive your right knee up to meet your right hand, bring the same leg back to the ground while immediately bring the left knee coming up to meet your left hand.//4. Repeat"),
        
        "Butt Kicks" : exercises1(description: "As you do butt kicks, several muscles contract to bring your heel toward your buttocks. The knee flexors such as the hamstrings contract to bend the knee, and the hip extensors, particularly the gluteus maximus, keep your knee from lifting in front of your body.", steps: "1. Stand with your legs shoulder-width apart. Your arms should be bent at your sides.//2. Flex the right knee and kick your right heel up toward your butt. Bring the right foot back down.//3. As the right leg comes down, flex your left knee and kick your left foot up toward your butt. Swing your arms as if you were jogging.//4. Repeat"),
        
        "Mountain climber" : exercises1(description: "If you value efficient moves in your strength-training workouts, mountain climbers are a perfect fit. They are a compound exercise, meaning they work several joints and muscle groups simultaneously. The steady running motion targets your glute and leg muscles, including your quadriceps and hamstrings.", steps: "1. Start in a pushup position with your butt higher up//2. Bring your right knee under your chest without touching it, feet still on the ground//3. As you stretch out your right knee back to its starting position, bring your left knee under your chest without touching it, feet still on the ground//4. Repeat the process in a constant motion"),
        
        "Forward Plank" : exercises1(description: "This is the most popular form of planking. The main muscle groups used during Plank are the core muscles that surround the trunk; the abdominal muscles and spinal muscles. Secondary muscles are also involved in stabilizing or holding the body in position during Forward Plank and these include muscles around the shoulder girdle, chest, middle back, thighs and calf.", steps: "1. Lie on your stomach on the floor with your elbows close to your sides and directly under your shoulders, palms down and fingers facing the front.//2. Lift your whole body up, Elbows bent at 90 degrees.//3. Keep your back straight. If you feel an ache on your lower back when performing the exercise, it would mean that you are arching your back."),
        
        "Side Plank" : exercises1(description: "This is a variation of planking. Unlike the Forward Plank, this form works your core to a huge extent, making it a great workout to get an all-rounded core ", steps: "1. Start on your side with your feet together and one forearm directly below your shoulder. //2. Lift the side of your body up, keeping it straight"),
        
        "Cobra Stretch" : exercises1(description: "The Cobra pose is a simple maneuver that can help to stretch your abdominal muscles and strengthen your lower back muscles. To a lesser degree, the exercise also works the muscles in your arms, shoulders, butt, and back of the legs", steps: "1. Lie flat on your stomach, on the floor. //2. Lift your upper body up while keeping your lower body on the floor, hands supporting your upper body."),
        
        "Crunch" : exercises1(description: "Crunches or abdominal crunches work the rectus abdominis muscle in the midsection of your body. Ab curls may also engage the external or internal oblique muscles, especially when rotation is added to the movement. Abdominal crunches are an effective way to strengthen the front of your torso or core region of your body.", steps: "1. Hold your elbows out to the sides but rounded slightly in. //2. Tilt your chin slightly, leaving a few inches of space between your chin and your chest.//3. Curl up and forward so that your head, neck, and shoulder blades lift off the floor. //4. Hold for a moment at the top of the movement and then lower slowly back down."),
        
        "Arm and Leg Raise" : exercises1(description: "This exercise works the muscles of your low back, butt (glutes), rear thighs (hamstrings), rear deltoid, and neck. ", steps: "1. Kneel down on the floor, hands on the ground, keeping your back parallel to the ground. //2. Raise your left leg and your right arm such that they form a straight line with your back. //3. Repeat for your other arm and leg to complete 1 rep."),
        
        "Ballet Twist" : exercises1(description: "Ballet twist is a simple stetch that engages your core muscles, as well as balance.", steps: "1. Sit on mat, with legs extended, toes pointed, thighs together. //2. Lean back, placing forearms on mat, palms flat, fingers forward. //3. Leaving left forearm on mat, lift right arm overhead and twist torso to left. //4. Return to center. //5. Switch arms and twist right."),
        
        "Bicycle Crunch" : exercises1(description: "While doing this exercise, keeping your legs off the ground works the lower abs. On the other hand, keeping your legs flat works the middle abs. Interestingly, bicycle crunches also work the rectus abdominis muscle (upper abs). This is the highest set of ab muscles you have.", steps: "1. Lie flat on your lower back on the ground. //2. Put your hands behind your head, then bring your knees in towards your chest and lift your shoulder blades off the ground, while not pulling your neck. //3. Straighten your right leg out to about a 45-degree angle to the ground while turning your upper body to the left, bringing your right elbow towards the left knee. //4. Switch sides and do the same"),
        
        "Butterfly Kick" : exercises1(description: "They work on the mid and lower abs, glutes, hip flexors, quads, and adductors. As a result, the entire lower body muscles are activated and toned.", steps: "1. Lie flat on your lower back on the ground. //2. Raise both legs up to about a 45-degree angle, while keeping them straight. //3. Slowly lower your left leg while bringing your right leg up. //4. Repeat for both legs."),
        
        "Leg Lift" : exercises1(description: "The leg raise is a strength training exercise which targets the iliopsoas (the interior hip flexors). Because the abdominal muscles are used isometrically to stabilize the body during the motion, leg raises are also often used to strengthen the rectus abdominis muscle and the internal and external oblique muscles.", steps: "1. Lie flat on your lower back on the ground. //2. Raise both legs up to about a 45-degree angle, while keeping them straight."),
        
        "Push-up" : exercises1(description: "The push-up is a very common strength training exercise that is used to strengthen the arm muscles, which are the vital muscles needed for incline Pull-ups. Completing push-ups is effective at developing upper body strength.", steps: "1. Lie flat on your stomach on the ground//2. Lift your upper body up with your hands, keeping the rest of your body straight.//3. Bend your arms, so that your chest nearly touches the floor and slowly straighten your arms, all the while keeping your lower body straight."),
        
        "Diamond Push-up" : exercises1(description: "The diamond pushup is a much harder variation of the standard pushup which increases the demands on the triceps and shoulders. ", steps: "1. Lie flat on your stomach on the ground, and lift your upper body up with your hands, keeping the rest of your body straight.//2. Place your hands directly below your head, forming a diamond shape with it. //3. Bend your arms, so that your chest nearly touches the floor and slowly straighten your arms, all the while keeping your lower body straight."),
        
        "Lunges" : exercises1(description: "The lunge is a classic fitness exercise for the lower body, which helps the flexibility of the hips and hamstrings, and the strength of the buttocks, hamstrings and hip flexors. ", steps: "1. Keep your upper body straight, with your shoulders back and relaxed and chin up (pick a point to stare at in front of you so you don't keep looking down).//2. Step forward with your left leg, lowering your hips until both knees are bent at about a 90-degree angle.//3. Make sure your front bent knee is directly above your ankle, not pushed out beyond your toes, and make sure your other knee doesn't touch the floor.//4. Repeat for the right leg to complete 1 rep"),
        "Squats" : exercises1(description: "The lunge is a classic fitness exercise for the lower body, which helps the flexibility of the hips and hamstrings, and the strength of the buttocks, hamstrings and hip flexors. ", steps: "1. Stand with your head facing forward and your chest held up and out.//2. Place your feet shoulder-width apart or slightly wider. Extend your hands straight out in front of you to help keep your balance. You can also bend the elbows or clasp the fingers.//3. Sit back and down like you're sitting into an imaginary chair. Keep your head facing forward as your upper body bends forward a bit. Rather than allowing your back to round, let your lower back arch slightly as you descend.//4. Lower down so your thighs are as parallel to the floor as possible, with your knees over your ankles. 5. Press your weight back into your heels.//6. Keep your body tight, and push through your heels to bring yourself back to the starting position."),
        "Counter-movement Jump" : exercises1(description: "The countermovement jump is a simple, practical, valid, and very reliable measure of lower-body power. CMJ has been shown to be the most reliable measure of lower-body power compared to other jump tests.", steps: "1. Dip down by bending your hips and knees.//2. Swing your arms back, then up, as you jump as high as possible, reaching for a mark on a wall or backboard. //3. Land softly with knees bent, shoulders slightly forward, and butt and hips back. //4. Reset and repeat. "),
        "Star Jump" : exercises1(description: "Star jumps strengthen your deltoids, the large muscles at the top curve of your shoulders, and the trapezius muscles between your shoulders and neck. They also work all your major leg muscles, including hamstrings, quadriceps, abductors, adductors and calves.", steps: "1. Squat down such that your butt is facing the ground.//2. Jump up as high as you can while spreading your arms and legs out like a star//3. On landing, squat down into your initial position//4. Repeat"),
        "Jumping jack" : exercises1(description: "A dynamic full-body exercise that is a popular warm-up excerise that increases body temperature, aerobic capacity, and strength.", steps: "1. Stand with your feet together and your hands at your sides. //2. Simultaneously raise your arms above your head and jump up just enough to spread your feet out wide.//3. Without pausing, quickly reverse the movement and repeat."),
        "Tuck Jump" : exercises1(description: "Tuck Jumps is an explosive exercise that works the core section primarily the rectus abdominis and transverse abdominis but also engages the quadriceps, gluteus muscles, hamstrings and calf muscles.", steps: "1. Start in a standing position, slightly bending your knees.//2. Hold your hands out at chest height.//3. Lower your body quickly into a squat position, then jump upwards bringing your knees up towards your chest.//4. Repeat"),
        "Box Jump" : exercises1(description: "Box jumps force you to jump high enough that you're forced to use every single muscle in your legs to get you up onto the box.", steps: "1. Start with a box of a suitable height placed in front of you//2. Have your legs open up shoulder width apart, feet facing front.//3. When you are ready, jump onto the box with both feet next to each other, still shoulder width apart//4. Jump back down without turning your body//5. While landing, cushion your fall"),
       
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaults.standard.string(forKey: "String")! + " 1")
        var array:[UIImage] = []
        if let image1 = UIImage(named: UserDefaults.standard.string(forKey: "String")! + " 1" + ".jpg"){
            
     array.append(image1)
        }
        if let image1 = UIImage(named: UserDefaults.standard.string(forKey: "String")! + " 2" + ".jpg"){
            
            array.append(image1)
        }
        if let image1 = UIImage(named: UserDefaults.standard.string(forKey: "String")! + " 3" + ".jpg"){
            
            array.append(image1)
        }
        if let image1 = UIImage(named: UserDefaults.standard.string(forKey: "String")! + " 4" + ".jpg"){
            
            array.append(image1)
        }
        print(array)
        image.animationImages = array
        image.animationDuration = Double(array.count) * 2.0
        image.startAnimating()
        print(UserDefaults.standard.string(forKey: "String"))
        let details:String = UserDefaults.standard.string(forKey: "String")!
        self.title = details
        
        print(nuuuu[details]?.description)
        var steps = nuuuu[details]?.steps
        steps = steps?.replacingOccurrences(of: "//", with: "\n")
        if(nuuuu[details]?.description == nil){
            
        }else{
        text.text = (nuuuu[details]?.description)! + "\n\nInstructions\n" + (steps)!
        text.updateTextFont()
        // Do any additional setup after loading the view.
        }
    }
    func updateTextFont() {
        if (text.text.isEmpty || text.bounds.size.equalTo(CGSize.zero)) {
            return;
        }
        
        let textViewSize = text.frame.size;
        let fixedWidth = textViewSize.width;
        let expectSize = text.sizeThatFits(CGSize(width:fixedWidth, height:CGFloat(MAXFLOAT)));
        
        var expectFont = text.font;
        if (expectSize.height > textViewSize.height) {
            while (text.sizeThatFits(CGSize(width:fixedWidth, height:CGFloat(MAXFLOAT))).height > textViewSize.height) {
                expectFont = text.font!.withSize(text.font!.pointSize - 1)
                text.font = expectFont
            }
        }
        else {
            while (text.sizeThatFits(CGSize(width:fixedWidth, height:CGFloat(MAXFLOAT))).height < textViewSize.height) {
                expectFont = text.font;
                text.font = text.font!.withSize(text.font!.pointSize + 1)
            }
            text.font = text.font!.withSize((expectFont?.pointSize)! - 30) ;
        }
    }
    struct exercises1{
        var description:String
        var steps:String
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension UITextView {
    func updateTextFont() {
        if (self.text.isEmpty || self.bounds.size.equalTo(CGSize.zero)) {
            return;
        }
        
        let textViewSize = self.frame.size;
        let fixedWidth = textViewSize.width;
        let expectSize = self.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat(MAXFLOAT)))
        
        
        var expectFont = self.font
        if (expectSize.height > textViewSize.height) {
            
            while (self.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat(MAXFLOAT))).height > textViewSize.height) {
                expectFont = self.font!.withSize(self.font!.pointSize - 1)
                self.font = expectFont
            }
            self.font = self.font!.withSize(self.font!.pointSize - 1)
        }
        else {
            while (self.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat(MAXFLOAT))).height < textViewSize.height) {
                expectFont = self.font
                self.font = self.font!.withSize(self.font!.pointSize + 1)
            }
            self.font = self.font!.withSize(self.font!.pointSize - 1)
        }
}
}
