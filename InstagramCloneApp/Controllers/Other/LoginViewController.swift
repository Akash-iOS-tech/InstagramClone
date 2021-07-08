import UIKit

class LoginViewController: UIViewController {
    
    static let cornerRadius: CGFloat = 8.0
    
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = cornerRadius
        field.backgroundColor = .secondarySystemBackground
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = cornerRadius
        field.backgroundColor = .secondarySystemBackground
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = cornerRadius
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let termsButton: UIButton = {
        return UIButton()
    }()
    
    private let privacyButton: UIButton = {
        return UIButton()
    }()
    
    private let createAccount: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        return button
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()
    
    private func addSubviews() {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccount)
        view.addSubview(headerView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // assign frames
        headerView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height/3.0)
        usernameEmailField.frame = CGRect(x: 25, y: headerView.bottom + 10, width: view.width - 50, height: 52)
        passwordField.frame = CGRect(x: 25, y: usernameEmailField.bottom + 10, width: view.width - 50, height: 52)
        loginButton.frame = CGRect(x: 25, y: passwordField.bottom + 10, width: view.width - 50, height: 52)
        createAccount.frame = CGRect(x: 25, y: loginButton.bottom + 10, width: view.width - 50, height: 52)
        
        configureHeaderView()
    }
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else { return }
    
    
    guard let backgroundView = headerView.subviews.first else { return }
        backgroundView.frame = headerView.bounds
        
        // Add Insta Logo
        
        let imageView = UIImageView(image: UIImage(named: "logo"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0, y: view.safeAreaInsets.top, width: headerView.width/2.0, height: headerView.height - view.safeAreaInsets.top)
}
    
    @objc private func didTapLoginButton() {
        
    }
    
    @objc private func didTapTermsButton() {
        
    }
    
    @objc private func didTapPrivacyButton() {
        
    }
    
    @objc private func didTapCreateAccountButton() {
        
    }
}
