import UIKit

struct EditProfileFormModel {
    let label: String
    let placeHolder: String
    var value: String?
}

final class EditProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FormTableViewCellDelegate {
    //Update the Model
    func formtableViewCell(cell: FormTableViewCell, didUpdateField updatedModel: EditProfileFormModel?)
    {

    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier, for: indexPath) as! FormTableViewCell
        cell.delegate = self
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else { return nil}
        return "Private Information"
    }
    
    private func createTableHeaderView() -> UIView {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height/4).integral)
        let size = header.height/3.0
        let profilePhotButton = UIButton(frame: CGRect(x: (view.width-size)/2, y: (header.height-size)/2, width: size, height: size))
        header.addSubview(profilePhotButton)
        profilePhotButton.layer.masksToBounds = true
        profilePhotButton.layer.cornerRadius = size/2.0
        profilePhotButton.tintColor = .label
        profilePhotButton.addTarget(self, action: #selector(didTapProfilePhotoButton), for: .touchUpInside)
        profilePhotButton.setBackgroundImage(UIImage(systemName: "person.circle"), for: .normal)
        profilePhotButton.layer.borderWidth = 1.0
        profilePhotButton.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        return header
    }
    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FormTableViewCell.self, forCellReuseIdentifier: FormTableViewCell.identifier)
        return tableView
    }()
    
    private var models = [[EditProfileFormModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = createTableHeaderView()
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapCancel))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureModels() {
        // First section:- name, username and bio
        let sections1Labels = ["Name", "Username", "Bio"]
        var section1 = [EditProfileFormModel]()
        for label in sections1Labels {
            let model = EditProfileFormModel(label: label, placeHolder: "Enter \(label)", value: nil)
            section1.append(model)
        }
        models.append(section1)
        
        let sections2Labels = ["Email", "Phone", "Gender"]
        var section2 = [EditProfileFormModel]()
        for label in sections2Labels {
            let model = EditProfileFormModel(label: label, placeHolder: "Enter\(label)", value: nil)
            section2.append(model)
        }
        models.append(section2)

        
        // Second section:- email, phone, gender
    }
    
    @objc private func didTapSave() {
        // Save into database
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func  didTapChangeProfilePicture() {
        let actionSheet = UIAlertController(title: "Profile Pictue", message: "Change Profile Picture", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose From Library", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
    
    @objc private func didTapProfilePhotoButton() {
        
    }

}
