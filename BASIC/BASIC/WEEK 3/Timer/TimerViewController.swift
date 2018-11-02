//
//  TimerViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 10. 31..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//



import UIKit

class TimerViewController: UIViewController {

    var seconds : Int = 120
    var timer = Timer()
    var isTimerRunning : Bool = false
    var resumeTapped : Bool = false
    
    @IBOutlet weak var startButtonLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseRestButtonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Timer"
        
        startButtonLabel.text = "Start"
        pauseRestButtonLabel.text = "Pause"
        timerLabel.text = timerFormatting(time: TimeInterval(seconds))
    }
    
    func timerFormatting(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()

            let alertController = UIAlertController(title: "Time is up", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            
        } else {
            seconds -= 1
            timerLabel.text = timerFormatting(time: TimeInterval(seconds))
        }
    }
    

    @IBAction func actionButton(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            if isTimerRunning == false {
                print("start")
                print(isTimerRunning)
                startTimer()
                isTimerRunning = true
            }
        case 2:
            if resumeTapped == false {
                timer.invalidate()
                resumeTapped = true
                isTimerRunning = true
                pauseRestButtonLabel.text = "Resume"
                print("pause")
                print(isTimerRunning)
            } else {
                startTimer()
                resumeTapped = false
                isTimerRunning = false
                pauseRestButtonLabel.text = "Pause"
                print("resume")
                print(isTimerRunning)
            }
        case 3:
            timer.invalidate()
            seconds = 120
            timerLabel.text = timerFormatting(time: TimeInterval(seconds))
            resumeTapped = false
            pauseRestButtonLabel.text = "Pause"
            isTimerRunning = false
            print("reset")
            print(isTimerRunning)
        default:
            break
        }
    }
    

}
