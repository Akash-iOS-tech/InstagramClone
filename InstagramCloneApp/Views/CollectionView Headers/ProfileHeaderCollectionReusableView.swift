
import UIKit

class ProfileHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
