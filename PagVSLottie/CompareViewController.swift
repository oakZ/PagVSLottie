//
//  CompareViewController.swift
//  PagVSLottie
//
//  Created by zx on 2022/3/10.
//

import UIKit
import Lottie
import libpag

class CompareViewController: UIViewController {

    let lottieView: AnimationView = AnimationView()
    let pagView: PAGView = PAGView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSStringFromClass(CompareViewController.self)
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(lottieView)
        view.addSubview(pagView)
        lottieView.frame = CGRect(x: 30, y: 100, width: view.frame.width - 60, height: 210)
        pagView.frame = CGRect(x: 30, y: 320, width: view.frame.width - 60, height: 210)
        
        // my_page_header_day
        loadFile(name: "live_product")
    }
    

    func loadFile(name: String) {
        print("\n")
        print(String(Date.now.timeIntervalSince1970))
        guard let animation = Animation.named(name) else {
            return
        }
        lottieView.animation = animation
        lottieView.loopMode = .loop
        print("\n")
        print(String(Date.now.timeIntervalSince1970))
        guard let path = Bundle.main.path(forResource: name, ofType: "pag") else {
            return
        }
        let pagFile = PAGFile.load(path)
        pagView.setComposition(pagFile)
        pagView.setRepeatCount(-1)
        print("\n")
        print(String(Date.now.timeIntervalSince1970))
        lottieView.play()
        pagView.play()
    }
}
