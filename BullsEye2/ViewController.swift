//  Created by Nekokoatl on 17/01/16.
import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var slider: UISlider!


    var currentValue = 50
    var targetValue = 0
    var score = 0
    var round = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
            startNewGame()
            updateLabels()
        
        let thumbImageNormal = UIImage(named: "misc_57")
        //slider
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        
        let thumbImageHighlighted = UIImage(named: "001_17")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
            }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
   @IBAction func startOver(){
            startNewGame()
            updateLabels()
    
    let transition  = CATransition()
    transition.type = kCATransitionFade
    transition.duration = 1
    transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    view.layer.addAnimation(transition, forKey: nil)
    }
    
    
    
    func startNewGame() {
        round = 0
        score = 0
        startNewRound()
    }
    
    
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    
    
    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        //модуль
        var points = 100 - difference
        
        round++
        
        var phrase0 = "well done!"
        if difference  == 0 {
            phrase0 = "Perfect!"
        points += 100}
        else if difference < 5 {
            phrase0 = "you are soooo good"
            if difference == 1 {
                points += 50}}
        else if difference < 10 { phrase0 = "Wow this is awesome!"}
        else if difference < 20 { phrase0 = "you can do it"}
        else if difference < 30 { phrase0 = "try harder"}
        else if difference > 85 { phrase0 = "meh"}
        
        score += points
            
        let message = "Your score is: \(points) points"
             /*    + "\nThe target value is: \(targetValue)"
                    + "\nThe difference is: \(difference)"  */
        
        let alert = UIAlertController(title: "\(phrase0)", message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default,
                                                handler: {action in
                                                                    self.startNewRound()
                                                                    self.updateLabels()})
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func sliderMoved (slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    
    
}
