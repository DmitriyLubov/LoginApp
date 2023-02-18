//
//  PersonBioViewController.swift
//  LoginApp
//
//  Created by Дмитрий Лубов on 18.02.2023.
//

import UIKit

final class PersonBioViewController: UIViewController {
    
    @IBOutlet var bioLabel: UILabel!
    
    var bio: String!
    var fullName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradient()
        title = "\(fullName ?? "") Bio"
        bioLabel.text = bio
    }
}
