//
//  LottieViewController.swift
//  PagVSLottie
//
//  Created by zx on 2022/3/9.
//

import UIKit
import Lottie

class LottieViewController: UIViewController {

    let lottieView: AnimationView = AnimationView()
    
    let leftButton: UIButton = UIButton(type: .roundedRect)
    let rightButton: UIButton = UIButton(type: .roundedRect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSStringFromClass(LottieViewController.self)
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(lottieView)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        leftButton.setTitle("pause", for: .selected)
        leftButton.setTitle("play", for: .normal)
        leftButton.addTarget(self, action: #selector(clicked(button:)), for: .touchUpInside)
        rightButton.setTitle("stop", for: .normal)
        rightButton.addTarget(self, action: #selector(clicked(button:)), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        lottieView.frame = CGRect(x: 30, y: 100, width: view.frame.width - 60, height: 210)
        leftButton.frame = CGRect(x: 80, y: view.frame.height - 80, width: 80, height: 50)
        rightButton.frame = CGRect(x: view.frame.width - 160, y: view.frame.height - 80, width: 80, height: 50)
    }
    
    func loadFile(name: String) {
        guard let animation = Animation.named(name) else {
            return
        }
        lottieView.animation = animation
        lottieView.loopMode = .loop
        play()
    }
    
    func play() {
        if lottieView.isAnimationPlaying {
            return
        }
        lottieView.play()
    }
    
    func stop() {
        lottieView.stop()
    }
    
    func pause() {
        lottieView.pause()
    }

    // event
    @objc private func clicked(button: UIButton) {
        if button == rightButton {
            stop()
            return
        }
        if !button.isSelected {
            if lottieView.animation == nil {
                // my_page_header_day
                loadFile(name: "live_product")
            }
            play()
        } else {
            pause()
        }
        button.isSelected = !button.isSelected
    }
}
