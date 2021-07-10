import Foundation
import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    
    public func registerUser(username: String, email: String, password: String) {
        /*
         
         - Check if username is available
         - Check if password is available
         - Create account
         - Insert account to database
         */
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping ((Bool) -> Void)) {
        if let email = email {
            // Email log in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    return
                }
                completion(true)
            }
        } else if let username = username {
            // username login
            print(username)
        }
    }
}


