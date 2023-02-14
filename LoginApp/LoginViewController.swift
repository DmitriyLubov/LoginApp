//
//  ViewController.swift
//  LoginApp
//
//  Created by Дмитрий Лубов on 14.02.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var userNameButton: UIButton!
    @IBOutlet var passwordButton: UIButton!
    
    private let userName = "q"
    private let password = "q"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if userNameTF.text != userName || passwordTF.text != password {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password"
            )
            passwordTF.text = ""
            return
        }
        
    }
    
    @IBAction func showHintButtonTapped(sender: UIButton) {
        switch sender {
        case userNameButton:
            showAlert(
                withTitle: "Oops!",
                andMessage: "Your name is \(userName) 😉"
            )
        default:
            showAlert(
                withTitle: "Oops!",
                andMessage: "Your password is \(password) 😉"
            )
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {

    }

}

// MARK: UIAlertController
extension LoginViewController {
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
