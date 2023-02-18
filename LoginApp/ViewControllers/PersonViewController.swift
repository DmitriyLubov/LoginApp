//
//  PersonViewController.swift
//  LoginApp
//
//  Created by Дмитрий Лубов on 17.02.2023.
//

import UIKit

final class PersonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let personBioVC = segue.destination as? PersonBioViewController
        guard let personBioVC else { return }
        
        personBioVC.title = "Person Bio"
    }
}
