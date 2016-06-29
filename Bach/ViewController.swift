//
//  ViewController.swift
//  Bach
//
//  Created by Alexis Araujo on 6/29/16.
//  Copyright © 2016 Alexis Araujo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    @IBOutlet weak var playPause: UIButton!
    
    var player = AVAudioPlayer()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        if let audioPath = NSBundle.mainBundle().pathForResource("adele", ofType: "mp3") {
        
        do {
            self.player = try AVAudioPlayer(contentsOfURL: NSURL(string: audioPath)!)
        } catch let error as NSError {
                print(error)
            }
        }
        
        slider.maximumValue = Float(self.player.duration)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func play(sender: AnyObject) {
        if (player.playing == true) {
            player.stop()
            playPause.setTitle("Play", forState: UIControlState.Normal)
             }
        else {
            player.play()
            playPause.setTitle("Pause", forState: UIControlState.Normal)
        }
    }
   
    

    
    @IBAction func stop(sender: AnyObject) {
        self.player.stop()
        self.player.currentTime = 0
    }
    
    @IBAction func sliderChanged(sender: AnyObject) {
        self.player.volume = sender.value 
    }
    
    @IBAction func timeSlider(sender: AnyObject) {
       self.player.stop()
        self.player.currentTime = NSTimeInterval(slider.value)
        self.player.prepareToPlay()
        self.player.play()
    }

    
}

