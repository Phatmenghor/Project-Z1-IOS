//
//  SplashScreenViewController.swift
//  Z1 App By Menghor
//
//  Created by MacBook Pro on 3/4/23.
//

import UIKit

class SplashScreenViewController: UIViewController {
    @IBOutlet var bottomLabel: UILabel!
    @IBOutlet var textWelcomeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        textWelcomeLabel.text = ""

        let textWelcome = "Welcome To Z1 By Menghor"
        let bottomText = "Enjoy Your Day Bruzz"

        var charIndex = 0.0

        for welcome in textWelcome {
            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false) { _ in self.textWelcomeLabel.text?.append(welcome)
            }
            charIndex += 1
        }


        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let main = MainTabbarViewController()
            let mainTabBarController = UINavigationController(rootViewController: main)
            mainTabBarController.modalPresentationStyle = .fullScreen
            mainTabBarController.modalTransitionStyle = .coverVertical
            self.present(mainTabBarController, animated: true) {
                UIView.animate(withDuration: 1.0, delay: 0.5, animations: {
                    self.view.alpha = 0
                }, completion: nil)
            }
        }
    }
}
