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
    
    @IBOutlet var userNameButton: UIButton!
    @IBOutlet var passwordButton: UIButton!
    
    // MARK: - Private Property
    private let userName = "Lubov Dmitriy Evgen'evich"
    private let password = "q"

    // MARK: - Override Methods
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
        
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        welcomeVC.name = userName
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
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
        guard segue.source is WelcomeViewController else { return }
        
        userNameTF.text = ""
        passwordTF.text = ""
    }

}

//MARK: UIAlertController
private extension LoginViewController {
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}
