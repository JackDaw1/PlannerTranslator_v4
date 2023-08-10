import UIKit

class ProfileDetailViewController: UIViewController {
    
    var nameTextField: UITextField = UITextField()
    var contact1TextField: UITextField = UITextField()
    var contact2TextField: UITextField = UITextField()
    
    var editButton: UIButton = UIButton()
    let shareButton = UIButton()
    
    var presenter: ProfileDetailPresenterProtocol?
    var enableForEdit: Bool = false {
        didSet {
        }
    }
    
    private func baseConfigure() {
        view.backgroundColor = UIColor.white
        
        nameTextField.placeholder = "Введите ФИО"
        contact1TextField.placeholder = "Введите логин телеграмма"
        contact2TextField.placeholder = "Введите почту"
        
        nameTextField.textColor = UIColor.black
        contact1TextField.textColor = UIColor.black
        contact2TextField.textColor = UIColor.black
        
    }
    
    func setupConstraints() {
        [
            nameTextField,
            contact1TextField,
            contact2TextField,
            shareButton
            
        ].forEach { customView in
            view.addSubview(customView)
            customView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            nameTextField.heightAnchor.constraint(equalToConstant: 60),
            
            contact1TextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            contact1TextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            contact1TextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            contact1TextField.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            contact1TextField.heightAnchor.constraint(equalToConstant: 60),
            
            contact2TextField.leadingAnchor.constraint(equalTo: contact1TextField.leadingAnchor),
            contact2TextField.trailingAnchor.constraint(equalTo: contact1TextField.trailingAnchor),
            contact2TextField.topAnchor.constraint(equalTo: contact1TextField.bottomAnchor),
            contact2TextField.heightAnchor.constraint(equalToConstant: 60),
            contact2TextField.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
            shareButton.leadingAnchor.constraint(equalTo: contact2TextField.leadingAnchor),
            shareButton.trailingAnchor.constraint(equalTo: contact2TextField.trailingAnchor),
            shareButton.topAnchor.constraint(equalTo: contact2TextField.bottomAnchor),
            shareButton.heightAnchor.constraint(equalToConstant: 60),
            shareButton.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        baseConfigure()
        
        presenter?.viewDidLoad()

        shareButton.setTitle("Поделиться", for: .normal)
        view.addSubview(shareButton)
        //shareButton.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        shareButton.setTitleColor(.black, for: .normal)
        shareButton.backgroundColor = UIColor.lightGray

    }
    

    @objc func didTapShareButton(_ sender: Any) {
        let textMyContacts = "Мои контакты: \n"
        let objectsToShare: [Any] = [textMyContacts, nameTextField.text, contact1TextField.text, contact2TextField.text]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = sender as! UIView
        
        self.present(activityVC, animated: true, completion: nil)
    }
}



extension ProfileDetailViewController: ProfileDetailViewProtocol {
    
    func showProfile(_ profile: ProfileItem) {
        
        if profile.name != nil {
            nameTextField.text = profile.name
        }
        
        if profile.contact1 != nil {
            contact1TextField.text = profile.contact1
        }
        
        if profile.contact2 != nil {
            contact2TextField.text = profile.contact2
        }
        
    }
    
}


