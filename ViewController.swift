//
//  ViewController.swift
//  Light
//
//  Created by Larik on 06.09.2018.
//  Copyright © 2018 Larik. All rights reserved.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {

    var lightOn = false
    
    @IBAction func buttonPressed(_ sender: UIButton) {
       lightOn = !lightOn
        updateUI()
    }
    
    @IBOutlet weak var lightType: UILabel!
   
    func updateUI() {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        
        if let dev = device, dev.hasTorch {
            view.backgroundColor = .black
            do {
                try dev.lockForConfiguration()
                dev.torchMode = lightOn ? .on : .off
                dev.unlockForConfiguration()
                view.backgroundColor = lightOn ? .white : .black
                if lightOn {
                     lightType.textColor = .black
                    print(lightType.text = "Фонарик включен")
                } else {
                    lightType.textColor = .white
                    print(lightType.text = "Фонарик выключен")
                }
            } catch {
                print(error)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       updateUI()
    }


}

