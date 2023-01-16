import UIKit

class AddOrderViewController: UIViewController, UIPickerViewDelegate {
    
    var nameTextField: UITextField = UITextField()
    var priceTextField: UITextField = UITextField()
    var customerTextField: UITextField = UITextField()
    var deadlineLabel: UILabel = UILabel()
    var saveButton: UIButton = UIButton()
    var pickView: UIDatePicker = UIDatePicker()
    private var selectedDate: String? = nil
    var handler: ((OrderItem) -> Void)?
    
    private func baseConfigure() {
        view.backgroundColor = UIColor.white
        
        nameTextField.placeholder = "Название заказа"
        
        priceTextField.placeholder = "Стоимость"
        priceTextField.keyboardType = UIKeyboardType.numberPad
        
        customerTextField.placeholder = "Заказчик"
        
        saveButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        saveButton.setTitleColor(UIColor.gray, for: UIControl.State.selected)
        saveButton.setTitle("Save", for: UIControl.State.normal)
        saveButton.setTitle("Save", for: UIControl.State.selected)
        saveButton.addTarget(self, action: #selector(save), for: UIControl.Event.touchUpInside)
        
        pickView.datePickerMode = .date
        pickView.addTarget(self, action: #selector(datePickerValueChanged), for: UIControl.Event.valueChanged)
    }
    
    @objc
    func datePickerValueChanged(_ sender: UIDatePicker){
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        selectedDate = dateFormatter.string(from: sender.date)
        
    }
    
    func setupConstraints() {
        [
            nameTextField,
            priceTextField,
            pickView,
            customerTextField,
            deadlineLabel,
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
            
            priceTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            priceTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            priceTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            priceTextField.heightAnchor.constraint(equalToConstant: 60),
            
            customerTextField.leadingAnchor.constraint(equalTo: priceTextField.leadingAnchor),
            customerTextField.trailingAnchor.constraint(equalTo: priceTextField.trailingAnchor),
            customerTextField.topAnchor.constraint(equalTo: priceTextField.bottomAnchor),
            customerTextField.heightAnchor.constraint(equalToConstant: 60),
            
            pickView.topAnchor.constraint(equalTo: customerTextField.bottomAnchor),
            pickView.heightAnchor.constraint(equalToConstant: 60),
            pickView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            saveButton.leadingAnchor.constraint(equalTo: pickView.leadingAnchor),
            saveButton.trailingAnchor.constraint(equalTo: pickView.trailingAnchor),
            saveButton.topAnchor.constraint(equalTo: pickView.bottomAnchor),
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
        handler?(OrderItem(link: nil, deadline: selectedDate, paid: nil, name: nameTextField.text ?? "", price: Double(priceTextField.text ?? "0"), numberOfSigns: nil, customer: customerTextField.text ?? ""))
        //        switchView.isSelected
        //        pickView.selectedRow(inComponent: 0)
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
