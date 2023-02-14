//
//  ViewController.swift
//  LoginApp
//
//  Created by Дмитрий Лубов on 14.02.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    // MARK: - Private Property
    private let userName = "q"
    private let password = "q"

    // MARK: - Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if checkLogIN() {
            guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
            
            welcomeVC.name = userName
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction func showHintButtonTapped(sender: UIButton) {
        switch sender.currentTitle {
        case "Forgot User Name?":
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
        if segue.source is WelcomeViewController {
            userNameTF.text = ""
            passwordTF.text = ""
        }
    }
    
    // MARK: - Privat Methods
    private func checkLogIN() -> Bool {
        if userNameTF.text != userName || passwordTF.text != password {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password"
            )
            passwordTF.text = ""
            
            return false
        }
        return true
    }

}

// MARK: - UIAlertController
private extension LoginViewController {
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}
