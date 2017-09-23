//
//  ViewController.swift
//  hustle-mode
//
//  Created by Ashutosh  Purushottam on 23/09/17.
//  Copyright © 2017 Vivid Designs. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var onLabel: UILabel!
    @IBOutlet weak var hustleLabel: UILabel!
    
    var player:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }

    @IBAction func powerPressed(_ sender: Any) {
        containerView.isHidden = false
        player.play()

        UIView.animate(withDuration: 5, animations: {
            self.rocket.frame = CGRect(x: 0, y: 20, width: 373, height: 173)
            
        }) { (finished) in
            self.onLabel.isHidden = false
            self.hustleLabel.isHidden = false
        }
    }
    
}

