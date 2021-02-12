//
//  ViewController.swift
//  SoundBtn
//
//  Created by 駒木剛瑠 on 2021/02/01.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var soundBreak: AVAudioPlayer? //音

    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialize()
        // Do any additional setup after loading the view.
    }
    
    func Initialize() {
        
        let NiceFollowBtn = CustomButton()
        NiceFollowBtn.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        NiceFollowBtn.backgroundColor = .orange
        NiceFollowBtn.setTitle("ないふぉ〜", for: .normal)
        NiceFollowBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        NiceFollowBtn.addTarget(self, action: #selector(NiceFollowBtn(_:)), for: .touchUpInside)
        NiceFollowBtn.layer.cornerRadius = NiceFollowBtn.frame.width/2
        NiceFollowBtn.center = self.view.center
        
        self.view.addSubview(NiceFollowBtn)
        
    }
    
    @objc public func NiceFollowBtn(_ sender: CustomButton) {
        PlaySounds(Sound: "Lap")
    }
    
    
    
    // サウンド
    func PlaySounds(Sound: String) {
        let path = Bundle.main.path(forResource: Sound, ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
             soundBreak = try AVAudioPlayer(contentsOf: url)
            soundBreak?.play()
        } catch {
            // error handling
        }
    }


}

