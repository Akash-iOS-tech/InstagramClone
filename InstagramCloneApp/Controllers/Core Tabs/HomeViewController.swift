import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handleNotAuthenticated()
    }
    
    private func handleNotAuthenticated() {
        // Chek auth status
        
        if Auth.auth().currentUser == nil {
            // Show login Controller
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false, completion: nil)
        }
    }
    
}

