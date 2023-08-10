import UIKit

class OrderDetailViewController: UIViewController {
    
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
    
    let madeButton = UIButton()
    
    var presenter: OrderDetailPresenterProtocol?
    
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
            paidLabel,
            madeButton
            
        ].forEach { customView in
            view.addSubview(customView)
            customView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            
            customerLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            customerLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            customerLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            customerLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: customerLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: customerLabel.trailingAnchor),
            priceLabel.topAnchor.constraint(equalTo: customerLabel.bottomAnchor),
            priceLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
            deadlineLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            deadlineLabel.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            deadlineLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            deadlineLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
            timeLabel.leadingAnchor.constraint(equalTo: deadlineLabel.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: deadlineLabel.trailingAnchor),
            timeLabel.topAnchor.constraint(equalTo: deadlineLabel.bottomAnchor),
            timeLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
            madeButton.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor),
            madeButton.trailingAnchor.constraint(equalTo: timeLabel.trailingAnchor),
            madeButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            madeButton.heightAnchor.constraint(equalToConstant: 60),
            madeButton.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        baseConfigure()
        
        presenter?.viewDidLoad()
        
        madeButton.setTitle("Заказ сделан", for: .normal)
        view.addSubview(madeButton)
        madeButton.addTarget(self, action: #selector(didTapMadeButton), for: .touchUpInside)
        madeButton.setTitleColor(.black, for: .normal)
        madeButton.backgroundColor = UIColor.lightGray
        
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        
    }
    
    @objc private func didTapMadeButton() {
        presenter?.editOrder(link: nil, deadline: nil, made: true, paid: nil, name: nil, price: nil, numberOfSigns: nil, customer: nil, time: nil)
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

extension OrderDetailViewController: OrderDetailViewProtocol {
    
    func showOrder(_ order: OrderItem) {
        
        titleLabel.text = order.name
        customerLabel.text = "Заказчик: " + (order.customer ?? "")
        
        if order.price != nil {
            priceLabel.text = "Стоимость: " + String(order.price!)
        }
        //подправить с экстеншионом тустринг
        deadlineLabel.text = "Дата сдачи: " + (order.deadline ?? "")
        
    }
    
}

