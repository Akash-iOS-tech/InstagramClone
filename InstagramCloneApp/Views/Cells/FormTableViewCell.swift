
import UIKit

protocol FormTableViewCellDelegate: AnyObject {
    func formtableViewCell(cell: FormTableViewCell, didUpdateField value: String?)
}

class FormTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    static let identifier = "FormTableViewCell"
    private var model: EditProfileFormModel?
    
    public weak var delegate: FormTableViewCellDelegate?
    
    private let formLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.returnKeyType = .done
        return textField
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        contentView.addSubview(formLabel)
        contentView.addSubview(textField)
        textField.delegate = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        formLabel.frame = CGRect(x: 5, y: 0, width: contentView.width/3.0, height: contentView.height)
        textField.frame = CGRect(x: formLabel.right + 5, y: 0, width: contentView.width - 10 - formLabel.width, height: contentView.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        formLabel.text = nil
        textField.placeholder = nil
        textField.text = nil
        
    }
    
    public func configure(with model: EditProfileFormModel) {
        self.model = model
        formLabel.text = model.label
        textField.placeholder = model.placeHolder
        textField.text = model.value
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
   //     model?.value = textField.text
        delegate?.formtableViewCell(cell: self, didUpdateField: textField.text)
  //      guard let model = model else {return true}
        textField.resignFirstResponder()
        return true
    }
}
