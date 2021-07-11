import Foundation
import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    
    public func registerUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        /*
         
         - Check if username is available
         - Check if password is available
         - Create account
         - Insert account to database
         */
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                
                // Create account
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if error == nil, result != nil {
                        return
                    }
                    
                    // Insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { success in
                        if success {
                            completion(true)
                            return
                        } else {
                            completion(false)
                            return
                        }
                    }
                }
            } else {
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping ((Bool) -> Void)) {
        if let email = email {
            // Email log in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        } else if let username = username {
            // username login
            print(username)
        }
    }
    
    ///Attempt to logout firebase user
    public func logOut(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch {
            print(error)
            completion(false)
            return
        }
    }
}


