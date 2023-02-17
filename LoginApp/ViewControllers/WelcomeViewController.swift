//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Дмитрий Лубов on 14.02.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcome: UILabel!
    
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcome.text = "Welcome, \(name ?? "")!"
        setGradient()
    }
    
    private func setGradient() {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.systemPurple.cgColor, UIColor.systemIndigo.cgColor]
        layer.frame = view.frame
        view.layer.insertSublayer(layer, at: 0)
    }

}
