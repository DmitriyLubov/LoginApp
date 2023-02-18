//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Дмитрий Лубов on 14.02.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var name: String!
    var surname: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradient()
        welcomeLabel.text = "Welcome, \(name ?? "") \(surname ?? "")!"
    }
}

extension UIView {
    func setGradient() {
        let viewLayer = CAGradientLayer()
        viewLayer.colors = [UIColor.systemBlue.cgColor, UIColor.systemGreen.cgColor]
        viewLayer.frame = frame
        layer.insertSublayer(viewLayer, at: 0)
    }
}
