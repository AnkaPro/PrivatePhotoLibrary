import UIKit
import SwiftyKeychainKit

// MARK: enum
enum UserRegistrationStatus {
    case userNotRegistered
    case userRegistered
}

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: let/var
    var userRegistrationStatus = UserRegistrationStatus.userNotRegistered
    let accessSettings = AccessSettings()
    let collectionViewVC = CollectionViewController()
let loginView = LoginView()
    let accessKey = "Access"
    let keychain = Keychain(service: "keychain.service")
    let loginKey = KeychainKey<String>(key: "keychainLoginKey")
    let passwordKey = KeychainKey<String>(key: "keychainPasswordKey")
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        self.loginView.loginTextField.delegate = self
        self.loginView.passwordTextField.delegate = self
        self.loginView.checkPasswordTextField.delegate = self
    
        self.checkAccessSettings()
    }
    
    // MARK: funcs
    func checkAccessSettings() {
        let login = try? keychain.get(loginKey)
        let password = try? keychain.get(passwordKey)
        accessSettings.login = login
        accessSettings.password = password
        print(accessSettings.login)
        print(accessSettings.password)
        
        if accessSettings.login == nil || accessSettings.password == nil {
            self.userRegistrationStatus = .userNotRegistered
        } else {
            self.userRegistrationStatus = .userRegistered
        }
        
        switch userRegistrationStatus {
        case .userNotRegistered:
            self.loginView.loginPlaceholder = "Create login"
            self.loginView.passwordPlaceholder = "Create password"
            self.loginView.checkPasswordPlaceholder = "Repeat password"
            self.loginView.buttonTitle = "Register"
            self.loginView.setupRegisterUI()
            self.loginView.button.addTarget(self, action: #selector(registerNewUser), for: .touchUpInside)
        case .userRegistered:
            self.loginView.loginPlaceholder = "Enter login"
            self.loginView.passwordPlaceholder = "Enter password"
            self.loginView.buttonTitle = "Enter"
            self.loginView.setupEnterUI()
            self.loginView.button.addTarget(self, action: #selector(checkLoginAndPassword), for: .touchUpInside)
        }
    }

    
    @objc func registerNewUser() {
        guard let loginText = loginView.loginTextField.text else { return }
        if !loginText.isEmpty && loginView.passwordTextField.text == loginView.checkPasswordTextField.text {
            accessSettings.login = self.loginView.loginTextField.text
            accessSettings.password = self.loginView.passwordTextField.text
            guard let login = accessSettings.login else { return }
            guard let password = accessSettings.password else { return }
            try? keychain.set(login, for: loginKey)
            try? keychain.set(password, for: passwordKey)
            print("register is done")
            if let navController = self.navigationController {
                navController.pushViewController(self.collectionViewVC, animated: true)
                self.loginView.loginTextField.text?.removeAll()
                self.loginView.passwordTextField.text?.removeAll()
                self.loginView.checkPasswordTextField.text?.removeAll()
            }
        } else {
            animateCheckPasswordTextField()
            self.loginView.checkPasswordTextField.text?.removeAll()
        }
    }
    
    @objc func checkLoginAndPassword() {
        let login = try? keychain.get(loginKey)
        let password = try? keychain.get(passwordKey)
        if loginView.loginTextField.text == login && loginView.passwordTextField.text == password {
            if let navController = self.navigationController {
                navController.pushViewController(self.collectionViewVC, animated: true)
                self.loginView.loginTextField.text?.removeAll()
                self.loginView.passwordTextField.text?.removeAll()
            }
        } else {
            animatePasswordTextField()
        }
    }
    
    func animateCheckPasswordTextField() {
        UIView.animate(withDuration: 0.1) {
            self.loginView.checkPasswordTextFieldAnimatableConstraint.constant += 20
            self.view.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.loginView.checkPasswordTextFieldAnimatableConstraint.constant -= 20
                self.view.layoutIfNeeded()
            } completion: { _ in
                UIView.animate(withDuration: 0.1) {
                    self.loginView.checkPasswordTextFieldAnimatableConstraint.constant += 20
                    self.view.layoutIfNeeded()
                } completion: { _ in
                    self.loginView.checkPasswordTextFieldAnimatableConstraint.constant -= 20
                    self.view.layoutIfNeeded()
                }
            }
            
        }
    }
    
    func animatePasswordTextField() {
        UIView.animate(withDuration: 0.1) {
            self.loginView.passwordTextFieldAnimatableConstraint.constant += 20
            self.view.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.loginView.passwordTextFieldAnimatableConstraint.constant -= 20
                self.view.layoutIfNeeded()
            } completion: { _ in
                UIView.animate(withDuration: 0.1) {
                    self.loginView.passwordTextFieldAnimatableConstraint.constant += 20
                    self.view.layoutIfNeeded()
                } completion: { _ in
                    self.loginView.passwordTextFieldAnimatableConstraint.constant -= 20
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.loginView.scrollView.setContentOffset(CGPoint.zero, animated: true)
        self.view.endEditing(true)
        return true
    }
    
}

