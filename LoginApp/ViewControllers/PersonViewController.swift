//
//  PersonViewController.swift
//  LoginApp
//
//  Created by Дмитрий Лубов on 17.02.2023.
//

import UIKit

final class PersonViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var departmentLabel: UILabel!
    @IBOutlet var postLabel: UILabel!
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(person.name) \(person.surname)"
        setLabel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let personBioVC = segue.destination as? PersonBioViewController
        guard let personBioVC else { return }
        
        personBioVC.title = "Person Bio"
    }
    
    private func setLabel() {
        nameLabel.text = person.name
        surnameLabel.text = person.surname
        companyLabel.text = person.company
        departmentLabel.text = person.department
        postLabel.text = person.post
    }
}
