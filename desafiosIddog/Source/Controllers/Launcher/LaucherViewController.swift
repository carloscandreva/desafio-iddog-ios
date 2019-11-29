//
//  LaucherViewController.swift
//  genericAppForInterview
//
//  Created by Carlos Alberto Mota Candreva on 29/11/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import UIKit
import Lottie

class LaucherViewController: UIViewController, Storyboarded {

    // MARK: - Public properties
    @IBOutlet var animationView: AnimationView!
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        playAnimation()
    }

    func playAnimation() {
        animationView.animation = Animation.named("laucherAnimation")
        animationView.loopMode = .loop
        animationView.contentMode = .center
        animationView.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            self.coordinator?.beerList()
            self.animationView.stop()
        }
    }
}
