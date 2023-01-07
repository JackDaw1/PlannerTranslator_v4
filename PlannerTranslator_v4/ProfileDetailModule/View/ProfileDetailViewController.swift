//
//  ProfileDetailViewController.swift
//  PlannerTranslator_v4
//
//  Created by Galina Iaroshenko on 07.01.2023.
//

import UIKit

class ProfileDetailViewController: UIViewController {
    
    var nameLabel: UILabel = UILabel()
    var contact1Label: UILabel = UILabel()
    var contact2Label: UILabel = UILabel()
    
    var editButton: UIButton = UIButton()
    var shareButton: UIButton = UIButton()
    
    var presenter: ProfileDetailPresenterProtocol?
    
    private func baseConfigure() {
        view.backgroundColor = UIColor.white
    }
    
    func setupConstraints() {
        [
            nameLabel,
            contact1Label,
            contact2Label
            
        ].forEach { customView in
            view.addSubview(customView)
            customView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            nameLabel.heightAnchor.constraint(equalToConstant: 100),
            
            contact1Label.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            contact1Label.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            contact1Label.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            contact1Label.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
            contact2Label.leadingAnchor.constraint(equalTo: contact1Label.leadingAnchor),
            contact2Label.trailingAnchor.constraint(equalTo: contact1Label.trailingAnchor),
            contact2Label.topAnchor.constraint(equalTo: contact1Label.bottomAnchor),
            contact2Label.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
     
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

extension ProfileDetailViewController: ProfileDetailViewProtocol {
    
    func showProfile(_ profile: ProfileItem) {
        
        if profile.name != nil {
            nameLabel.text = profile.name
        }
        
        if profile.contact1 != nil {
            contact1Label.text = profile.contact1
        }
        
        if profile.contact2 != nil {
            contact2Label.text = profile.contact2
        }

    }
    
}


