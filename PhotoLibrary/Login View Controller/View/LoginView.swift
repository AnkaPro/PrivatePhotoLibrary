
import UIKit

class LoginView: UIView {

    let contentView = UIView()
    let welcomeLabel = UILabel()
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    let checkPasswordTextField = UITextField()
    let button = UIButton()
    var loginPlaceholder = String()
    var passwordPlaceholder = String()
    var checkPasswordPlaceholder = String()
    var buttonTitle = String()
    let scrollView = SPKeyBoardAvoiding()
    lazy var checkPasswordTextFieldAnimatableConstraint = self.checkPasswordTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
    lazy var passwordTextFieldAnimatableConstraint = self.passwordTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        scrollView.alwaysBounceVertical = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupRegisterUI() {
        self.backgroundColor = .white
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        welcomeLabel.text = "Welcome to your private Photo Library"
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = UIFont(name: "Avenir Next Heavy", size: 30)
        welcomeLabel.numberOfLines = 0
        
        loginTextField.borderStyle = .roundedRect
        loginTextField.placeholder = loginPlaceholder
        
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = passwordPlaceholder
        passwordTextField.isSecureTextEntry = true
        
        checkPasswordTextField.borderStyle = .roundedRect
        checkPasswordTextField.placeholder = checkPasswordPlaceholder
        checkPasswordTextField.isSecureTextEntry = true
        
        button.backgroundColor = .blue
        button.setTitle(buttonTitle, for: .normal)
        button.layer.cornerRadius = 20
        
        [welcomeLabel, loginTextField, passwordTextField, checkPasswordTextField, button].forEach { element in
            contentView.addSubview(element)
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            scrollView.heightAnchor.constraint(equalTo: self.heightAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.rightAnchor),
            scrollView.leftAnchor.constraint(equalTo: self.leftAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            welcomeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -50),
            welcomeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 50),
            welcomeLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/5),
            
            loginTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 50),
            loginTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/1.5),
            loginTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 30),
            passwordTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/1.5),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            checkPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            checkPasswordTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/1.5),
            checkPasswordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            button.topAnchor.constraint(equalTo: checkPasswordTextField.bottomAnchor, constant: 100),
            button.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/15),
            button.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/2.5)
        ])

        self.checkPasswordTextFieldAnimatableConstraint.isActive = true
    }
    
    
    func setupEnterUI() {
        self.backgroundColor = .white
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        welcomeLabel.text = "Welcome to your private \nPhoto Library"
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = UIFont(name: "Avenir Next Heavy", size: 30)
        welcomeLabel.numberOfLines = 0
        
        loginTextField.borderStyle = .roundedRect
        loginTextField.placeholder = loginPlaceholder
        
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = passwordPlaceholder
        passwordTextField.isSecureTextEntry = true
        
        button.backgroundColor = .blue
        button.setTitle(buttonTitle, for: .normal)
        button.layer.cornerRadius = 20
        
        [welcomeLabel, loginTextField, passwordTextField, button].forEach { element in
            contentView.addSubview(element)
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.rightAnchor),
            scrollView.leftAnchor.constraint(equalTo: self.leftAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            welcomeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -50),
            welcomeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor , constant: 50),
            welcomeLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/5),
            
            loginTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 50),
            loginTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/1.5),
            loginTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 30),
            passwordTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/1.5),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            button.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 100),
            button.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/15),
            button.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/2.5)
            
        ])

        passwordTextFieldAnimatableConstraint.isActive = true
    }
}
