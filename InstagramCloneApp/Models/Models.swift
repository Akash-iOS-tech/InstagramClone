
import Foundation


///Represent a user post
public struct UserPost {
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL: URL // either video url or photo resolution url
    let caption: String?
    let likecount: [PostLikes]
    let comments: [PostComments]
    let postedDate: Date
    let taggedUsers: [String]
}

struct User {
    let username: String
    let name: (first: String, last: String)
    let birthDate: Data
    let bio: String
    let counts: UserCount
    let gender: Gender
    let joinDate: Date
}

struct UserCount {
    let followers: Int
    let following: Int
    let posts: Int
}

struct PostComments {
    let identifier: String
    let likes: [CommentsLike]
    let username: String
    let text: String
    let createdDate: String
}

struct CommentsLike {
    let username: String
    let postidentidier: String
}

struct PostLikes {
    let username: String
    let postidentidier: String
}

enum UserPostType {
    case photo, video
}

enum Gender {
    case male, female, other
}
