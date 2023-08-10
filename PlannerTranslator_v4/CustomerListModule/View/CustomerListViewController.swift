import UIKit

class CustomerListViewController: UITableViewController {
    
    var presenter: CustomerListPresenterProtocol?
    var customers: [CustomerItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private func baseConfigure() {
        view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseConfigure()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }
    
    private func setupView() {
        tableView.tableFooterView = UIView()
        tableView.register(CustomerTableViewCell.self, forCellReuseIdentifier: "CustomerTableViewCell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: UIBarButtonItem.Style.plain, target: self, action: #selector(addTapped))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerTableViewCell", for: indexPath) as? CustomerTableViewCell
        else {
            return UITableViewCell()
        }
        
        let customer = customers[indexPath.row]
        cell.customer = customer
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let customer = customers[indexPath.row]
        presenter?.showCustomerDetail(customer)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let customerItem = customers[indexPath.row]
            presenter?.removeCustomer(customerItem)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    
    @objc
    func addTapped(_ sender: Any) {
        var addVC = AddCustomerViewController()
        addVC.handler = { [weak self] newCustomer in
            guard let self = self else { return }
            self.presenter?.addCustomer(newCustomer)
        }
        addVC.modalPresentationStyle = .formSheet
        present(addVC, animated: true)
    }
    
}

extension CustomerListViewController: CustomerListViewProtocol {
    func showCustomers(_ customers: [CustomerItem]) {
        self.customers = customers
    }
    
    func showErrorMessage(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
