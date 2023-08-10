import UIKit

class CustomerTableViewCell: UITableViewCell {
    
    var customer: CustomerItem? {
        didSet {
            guard let customerItem = customer else {return}
            let nameOfArticle = customerItem.name
            profileImageView.image = UIImage(named: nameOfArticle)
            nameOfArticleLabel.text = nameOfArticle
            
            if let customer = customerItem.info {
                customerDetailedLabel.text = " \(customer) "
            }
            
            if let price = customerItem.contact1 {
                priceDetailedLabel.text = " \(price) "
            }
        }
    }
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    let profileImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    let nameOfArticleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let customerDetailedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .white
        label.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceDetailedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .white
        label.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(profileImageView)
        containerView.addSubview(nameOfArticleLabel)
        containerView.addSubview(customerDetailedLabel)
        containerView.addSubview(priceDetailedLabel)
        self.contentView.addSubview(containerView)
        
        nameOfArticleLabel.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: NSLayoutConstraint.Axis.horizontal)
        customerDetailedLabel.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: NSLayoutConstraint.Axis.horizontal)
        
        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10),
            profileImageView.widthAnchor.constraint(equalToConstant:70),
            profileImageView.heightAnchor.constraint(equalToConstant:70),
            
            containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:10),
            containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10),
            containerView.heightAnchor.constraint(equalToConstant:40),
            
            nameOfArticleLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor),
            nameOfArticleLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor),
            nameOfArticleLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor),
            
            customerDetailedLabel.topAnchor.constraint(equalTo:self.nameOfArticleLabel.bottomAnchor),
            customerDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor),
            
            priceDetailedLabel.topAnchor.constraint(equalTo:self.customerDetailedLabel.bottomAnchor),
            priceDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor),
            
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

