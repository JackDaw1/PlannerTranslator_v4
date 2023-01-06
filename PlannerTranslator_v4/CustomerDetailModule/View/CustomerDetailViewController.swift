//
//  CustomerDetailViewController.swift
//  PlannerTranslator_v4
//
//  Created by Galina Iaroshenko on 06.01.2023.
//

import UIKit

class CustomerDetailViewController: UIViewController {
    
    var titleLabel: UILabel = UILabel()
    var deadlineLabel: UILabel = UILabel()
    var timeLabel: UILabel = UILabel()
    var priceLabel: UILabel = UILabel()
    var customerLabel: UILabel = UILabel()
    var numberOfSignsLabel: UILabel = UILabel()
    var maidLabel: UILabel = UILabel()
    var paidLabel: UILabel = UILabel()
    
    var deleteButton: UIButton = UIButton()
    var editButton: UIButton = UIButton()
    
    var presenter: CustomerDetailPresenterProtocol?
    
    private func baseConfigure() {
        view.backgroundColor = UIColor.white
    }
    
    func setupConstraints() {
        [
            titleLabel,
            deadlineLabel,
            timeLabel,
            priceLabel,
            customerLabel,
            numberOfSignsLabel,
            maidLabel,
            paidLabel
            
        ].forEach { customView in
            view.addSubview(customView)
            customView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            
            timeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            timeLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
            timeLabel.leadingAnchor.constraint(equalTo: deadlineLabel.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: deadlineLabel.trailingAnchor),
            timeLabel.topAnchor.constraint(equalTo: deadlineLabel.bottomAnchor),
            timeLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor)
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
        titleLabel.text = customer.name
        //timeLabel.text = String(order.time)
        //customerLabel.text = order.customer
    }
    
}
