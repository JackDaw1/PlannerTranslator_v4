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
        nameLabel.textColor = UIColor.black
        contact1Label.textColor = UIColor.black
        contact2Label.textColor = UIColor.black
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
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            
            contact1Label.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            contact1Label.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            contact1Label.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            contact1Label.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            contact1Label.heightAnchor.constraint(equalToConstant: 60),
            
            contact2Label.leadingAnchor.constraint(equalTo: contact1Label.leadingAnchor),
            contact2Label.trailingAnchor.constraint(equalTo: contact1Label.trailingAnchor),
            contact2Label.topAnchor.constraint(equalTo: contact1Label.bottomAnchor),
            contact2Label.heightAnchor.constraint(equalToConstant: 60),
            contact2Label.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
     
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        baseConfigure()
        
        presenter?.viewDidLoad()
    }
    
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


