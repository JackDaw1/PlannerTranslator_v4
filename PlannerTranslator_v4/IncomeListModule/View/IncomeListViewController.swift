import UIKit

struct SectionIncomesItem {
    var incomes: [OrderItem] = []
    var date: Date
    var sum: String {
        get {
            let prices = incomes.compactMap({ $0.price ?? 0.0 })
            return String(prices.reduce(0, +))
        }
    }
}

class IncomeListViewController: UITableViewController {
    
    var presenter: IncomeListPresenterProtocol?
    var sectionsArray: [SectionIncomesItem] = [] {
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
    }
    //определяем сколько секций в таблице
    override func numberOfSections(in tableView: UITableView) -> Int {
        sectionsArray.count
    }
    
    //настраиваем строки секции (в ней хранятся 1 хедер и множество ячеек (строк))
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsArray[section].incomes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as? OrderTableViewCell
        else {
            return UITableViewCell()
        }
        
        let income = sectionsArray[indexPath.section].incomes[indexPath.row]
        cell.order = income
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if (Double(sectionsArray[section].sum) != 0.0) {
            return "Общий доход: " + sectionsArray[section].sum
        }
        else
        {
            return nil
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}

extension IncomeListViewController: IncomeListViewProtocol {
    
    func showIncomes(_ sections: [SectionIncomesItem]) {
        self.sectionsArray = sections
    }
    
    func showErrorMessage(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}

