import Foundation
import FirebaseStorage

public class StorageManager {
    
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public func uploadUserPost(model: Post, completion: @escaping (Result<URL, Error>) -> Void) {
        
    }
    
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, Error>) -> Void) {
        bucket.child(reference).downloadURL { url, error in
            guard let url = url, error == nil else {
                completion(.failure(IGSTorageManagerError.failedToDownload))
                return
            }
            completion(.success(url))
        }
    }
    
    
    
    enum IGSTorageManagerError: Error {
        case failedToDownload
    }
}

public struct Post {
    let postType: UserPostType
}

enum UserPostType {
    case photo, video
}
