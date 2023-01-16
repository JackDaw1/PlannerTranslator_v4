
import UIKit

class AddCustomerViewController: UIViewController {
    
    var nameTextField: UITextField = UITextField()
    var infoTextField: UITextField = UITextField()
    var contact1TextField: UITextField = UITextField()
    var contact2TextField: UITextField = UITextField()
    var saveButton: UIButton = UIButton()
    
    var handler: ((CustomerItem) -> Void)?
    
    private func baseConfigure() {
        view.backgroundColor = UIColor.white
        
        nameTextField.placeholder = "Название компании"
        infoTextField.placeholder = "Контактное лицо"
        contact1TextField.placeholder = "Контакт 1"
        contact2TextField.placeholder = "Контакт 2"
        saveButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        saveButton.setTitleColor(UIColor.gray, for: UIControl.State.selected)
        
        saveButton.setTitle("Save", for: UIControl.State.normal)
        saveButton.setTitle("Save", for: UIControl.State.selected)
        saveButton.addTarget(self, action: #selector(save), for: UIControl.Event.touchUpInside)
    }
    
    func setupConstraints() {
        [
            nameTextField,
            infoTextField,
            contact1TextField,
            contact2TextField,
            saveButton
        ].forEach { customView in
            view.addSubview(customView)
            customView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            nameTextField.heightAnchor.constraint(equalToConstant: 60),
            
            infoTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            infoTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            infoTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            infoTextField.heightAnchor.constraint(equalToConstant: 60),
            
            contact1TextField.leadingAnchor.constraint(equalTo: infoTextField.leadingAnchor),
            contact1TextField.trailingAnchor.constraint(equalTo: infoTextField.trailingAnchor),
            contact1TextField.topAnchor.constraint(equalTo: infoTextField.bottomAnchor),
            contact1TextField.heightAnchor.constraint(equalToConstant: 60),
            
            contact2TextField.leadingAnchor.constraint(equalTo: contact1TextField.leadingAnchor),
            contact2TextField.trailingAnchor.constraint(equalTo: contact1TextField.trailingAnchor),
            contact2TextField.topAnchor.constraint(equalTo: contact1TextField.bottomAnchor),
            contact2TextField.heightAnchor.constraint(equalToConstant: 60),
            
            saveButton.leadingAnchor.constraint(equalTo: contact2TextField.leadingAnchor),
            saveButton.trailingAnchor.constraint(equalTo: contact2TextField.trailingAnchor),
            saveButton.topAnchor.constraint(equalTo: contact2TextField.bottomAnchor),
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        baseConfigure()
        
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.backgroundColor = UIColor.lightGray
    }
    
    @objc
    func save() {
        //TODO: настроить алерт сообщение о важности внесения имени
        handler?(CustomerItem(name: nameTextField.text ?? "", info: infoTextField.text ?? "", contact1: nameTextField.text ?? "", contact2: nameTextField.text ?? ""))
        self.dismiss(animated: true)
    }
//
//    func editTapped(_ sender: Any) {
//        let alertController = UIAlertController(title: "Edit Order Item", message: "Enter title and content", preferredStyle: .alert)
//
//        alertController.addTextField { $0.text = self.titleLabel.text }
//        alertController.addTextField { $0.text = self.contentLabel.text }
//        alertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak self](_) in
//            let titleText = alertController.textFields![0].text ?? ""
//            let contentText = alertController.textFields![1].text ?? ""
//            guard !titleText.isEmpty else { return }
//            self?.presenter?.editOrder(title: titleText, content: contentText)
//        }))
//
//        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        present(alertController, animated: true, completion: nil)
//
//    }
    
}
