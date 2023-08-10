//
//  CustomerDetailViewController.swift
//  PlannerTranslator_v4
//
//  Created by Galina Iaroshenko on 06.01.2023.
//

import UIKit

class CustomerDetailViewController: UIViewController {
    
    var titleLabel: UILabel = UILabel()
    var infoLabel: UILabel = UILabel()
    var contact1Label: UILabel = UILabel()
    var contact2Label: UILabel = UILabel()
    
    var deleteButton: UIButton = UIButton()
    var editButton: UIButton = UIButton()
    
    var presenter: CustomerDetailPresenterProtocol?
    
    private func baseConfigure() {
        view.backgroundColor = UIColor.white
    }
    
    func setupConstraints() {
        [
            titleLabel,
            infoLabel,
            contact1Label,
            contact2Label
            
        ].forEach { customView in
            view.addSubview(customView)
            customView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            infoLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            infoLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
            contact1Label.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            contact1Label.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
            contact1Label.topAnchor.constraint(equalTo: infoLabel.bottomAnchor),
            contact1Label.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
            contact2Label.leadingAnchor.constraint(equalTo: contact1Label.leadingAnchor),
            contact2Label.trailingAnchor.constraint(equalTo: contact1Label.trailingAnchor),
            contact2Label.topAnchor.constraint(equalTo: contact1Label.bottomAnchor),
            contact2Label.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        baseConfigure()
        
        presenter?.viewDidLoad()
    }
    
//    func deleteTapped(_ sender: Any) {
//        presenter?.deleteOrder()
//    }
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

extension CustomerDetailViewController: CustomerDetailViewProtocol {
    
    func showCustomer(_ customer: CustomerItem) {
        titleLabel.text = "Компания: " + customer.name
        infoLabel.text = "Контактное лицо: " + (customer.info ?? "")
        contact1Label.text = "Контакт 1: " + (customer.contact1 ?? "")
        contact2Label.text = "Контакт 2: " + (customer.contact2 ?? "")
    }
    
}
