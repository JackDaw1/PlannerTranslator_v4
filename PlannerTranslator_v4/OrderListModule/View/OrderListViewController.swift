
import UIKit

class OrderListViewController: UITableViewController {
    
    var presenter: OrderListPresenterProtocol?
    var orders: [OrderItem] = [] {
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
        tableView.register(OrderTableViewCell.self, forCellReuseIdentifier: "OrderTableViewCell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: UIBarButtonItem.Style.plain, target: self, action: #selector(addTapped))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as? OrderTableViewCell
        else {
            return UITableViewCell()
        }
        
        let order = orders[indexPath.row]
        cell.textLabel?.text = order.name
        cell.detailTextLabel?.text = order.customer
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let order = orders[indexPath.row]
        presenter?.showOrderDetail(order)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let orderItem = orders[indexPath.row]
            presenter?.removeOrder(orderItem)
        }
    }
    
@objc
func addTapped(_ sender: Any) {
    var addVC = AddOrderViewController()
    addVC.handler = { [weak self] newOrder in
        guard let self = self else { return }
        self.presenter?.addOrder(newOrder)
    }
    addVC.modalPresentationStyle = .formSheet
    present(addVC, animated: true)
    }
    
}

extension OrderListViewController: OrderListViewProtocol {
    
    func showOrders(_ orders: [OrderItem]) {
        self.orders = orders
    }
    
    func showErrorMessage(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}
