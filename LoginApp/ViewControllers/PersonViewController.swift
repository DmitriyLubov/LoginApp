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
    
    @IBOutlet var personImageView: UIImageView!
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(person.name) \(person.surname)"
        setLabel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let personBioVC = segue.destination as? PersonBioViewController
        guard let personBioVC else { return }
        
        personBioVC.bio = person.biography
        personBioVC.fullName = "\(person.name) \(person.surname)"
    }
    
    override func viewDidLayoutSubviews() {
        personImageView.layer.cornerRadius = personImageView.frame.width / 2
    }
    
    private func setLabel() {
        personImageView.image = UIImage(named: person.nameImage)
        nameLabel.text = person.name
        surnameLabel.text = person.surname
        companyLabel.text = person.company
        departmentLabel.text = person.department
        postLabel.text = person.post
    }
}
