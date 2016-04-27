//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Taryn Parker on 4/26/16.
//  Copyright © 2016 TarynParker. All rights reserved.
//

import UIKit
import AVFoundation

var audioPlayer = AVAudioPlayer()
var isPlaying = false
var timer:NSTimer!


class ViewController: UIViewController {
    
    @IBOutlet var trackTime: UILabel!
    @IBOutlet var trackTitle: UILabel!
    
    
    
    @IBAction func playPauseButton(sender: AnyObject) {
        if isPlaying {
            audioPlayer.pause()
            isPlaying = false
        } else {
            audioPlayer.play()
            isPlaying = true
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
        }
    }
    
    func updateTime() {
        let currentTime = Int(audioPlayer.currentTime)
        let minutes = currentTime/60
        let seconds = currentTime - minutes * 60
        
        trackTime.text = NSString(format: "%02d:%02d", minutes, seconds) as String
    }
    
    
    @IBAction func stopButton(sender: AnyObject) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        isPlaying = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trackTitle.text = "WhatsUp"
        let path = NSBundle.mainBundle().URLForResource("WhatsUp", withExtension: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: path!)
            audioPlayer.prepareToPlay()
        } catch {
            NSLog("error")
        }
        
        
    }
}






