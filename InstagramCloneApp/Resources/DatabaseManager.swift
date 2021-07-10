import Foundation
import FirebaseAuth
import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    
    ///Check if username and email is available
    ///- Parameters
    ///- email
    ///- username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    /// Insert new user into database
    /// - Parameters
    ///-username
    ///-email
    ///-completion: Async callback for result if database entry is succeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                return
            } else {
                completion(false)
                return
            }
        }
    }
}
