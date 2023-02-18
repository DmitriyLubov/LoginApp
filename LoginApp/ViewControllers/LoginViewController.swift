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
    private let user = User.getUser()
    
    private var userName: String {
        user.userName
    }
    private var password: String {
        user.password
    }

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.text = userName
        passwordTF.text = password
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let userTabBarVC = segue.destination as? UITabBarController
        
        guard let userTabBarVC else { return }
        guard let viewControllers = userTabBarVC.viewControllers else { return }
            
        viewControllers.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.name = user.person.name
                welcomeVC.surname = user.person.surname
            } else if let navigationVC = viewController as? UINavigationController {
                let personVC = navigationVC.topViewController as? PersonViewController
                guard let personVC else { return }
                personVC.person = user.person
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction func LogInButtonTapped() {
        if userNameTF.text != userName || passwordTF.text != password {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password",
                andClean: passwordTF
            )
            
            return
        }
        
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    
    @IBAction func showHintButtonTapped(sender: UIButton) {
        if sender.currentTitle == "Forgot User Name?" {
            showAlert(
                withTitle: "Oops!",
                andMessage: "Your name is \(userName) 😉"
            )
        } else {
            showAlert(
                withTitle: "Oops!",
                andMessage: "Your password is \(password) 😉"
            )
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: - UIAlertController
private extension LoginViewController {
    private func showAlert(withTitle title: String, andMessage message: String, andClean textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}
