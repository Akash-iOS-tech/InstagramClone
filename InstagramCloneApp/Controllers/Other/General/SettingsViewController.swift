import UIKit
import SafariServices
import FirebaseAuth

struct SettingCellModel {
    let title: String
    let handler: (() -> Void)
}

/// View controller to show user settings
final class SettingsViewController: UIViewController {
    
    /// since its going to be a 2 dimensional data
    private var data = [[SettingCellModel]]()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
       
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureModels() {
        data.append([SettingCellModel(title: "Edit Profile") { [weak self] in
            self?.didTapEditProfile()
        },
        SettingCellModel(title: "Invite Friends") { [weak self] in
            self?.didInviteFriends()
        },
        SettingCellModel(title: "Save Post") { [weak self] in
            self?.didSavePost()
        }
        ])
        
        data.append([SettingCellModel(title: "Terms Of Service") { [weak self] in
            self?.didOpenURL(type: SettinsURLType.terms)
        },
        SettingCellModel(title: "Privacy Policy") { [weak self] in
            self?.didOpenURL(type: SettinsURLType.privacy)
        },
        SettingCellModel(title: "Help/Feedback") { [weak self] in
            self?.didOpenURL(type: SettinsURLType.help)
        }
        ])
        
        data.append([SettingCellModel(title: "Log Out") { [weak self] in
            self?.didTapLogout()
        }
        ])
    }
    
    private func didTapEditProfile() {
        let vc = EditProfileViewController()
        vc.title = "Edit Profile"
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    private func didInviteFriends() {
        // Show share sheet to invite friends
        
    }
    
    private func didSavePost() {
        
    }
    
    private func didOpenURL(type: SettinsURLType) {
        
        let urlString: String
        switch type {
        case .terms: urlString = "https://help.instagram.com/581066165581870"
            
        case .privacy: urlString = "https://help.instagram.com/519522125107875"
        
        case .help: urlString = "https://help.instagram.com/"
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    
    enum SettinsURLType {
        case terms, privacy, help
    }
    
    private func didTapLogout() {
        let actionSheet = UIAlertController(title: "Log Out", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
            AuthManager.shared.logOut { success in
                DispatchQueue.main.async {
                    if success {
                        // Present Login
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    } else {
                        // error occured
                        fatalError("Could not Logout user")
                    }
                }
            }
        }))
        present(actionSheet, animated: true, completion: nil)
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = data[indexPath.section][indexPath.row]
        model.handler()
    }
}
