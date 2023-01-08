////
////  IncomeListViewController.swift
////  PlannerTranslator_v4
////
////  Created by Galina Iaroshenko on 07.01.2023.
////
//
//
//import UIKit
//
//struct SectionIncomesItem {
//    var incomes: [IncomeItem] = []
//    var date: Date
//}
//
//class IncomeListViewController: UITableViewController {
//    
//    var presenter: IncomeListPresenterProtocol?
//    var sectionsArray: [SectionIncomesItem] = [] {
//        didSet {
//            tableView.reloadData()
//        }
//    }
//    
//    private func baseConfigure() {
//        view.backgroundColor = UIColor.white
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        baseConfigure()
//        setupView()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        presenter?.viewWillAppear()
//    }
//    
//    private func setupView() {
//        tableView.tableFooterView = UIView()
//        tableView.register(IncomeTableViewCell.self, forCellReuseIdentifier: "IncomeTableViewCell")
//        
//        let newRightBarButtonItem = UIBarButtonItem(title: "+", style: UIBarButtonItem.Style.plain, target: self, action: #selector(addTapped))//
//        //  let newRightBarButtonItem = UIBarButtonItem(image: <#T##UIImage?#>, style: UIBarButtonItem.Style.plain, target: self, action: #selector(addTapped))
//        //Настройка текста кнопки если она использует текст
//        newRightBarButtonItem.setTitleTextAttributes(
//            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 36.0),
//             NSAttributedString.Key.foregroundColor : UIColor.blue],
//            for: UIControl.State.normal)
//        
//        newRightBarButtonItem.setTitleTextAttributes(
//            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 36.0),
//             NSAttributedString.Key.foregroundColor : UIColor.gray],
//            for: UIControl.State.selected)
//        //
//        navigationItem.rightBarButtonItem = newRightBarButtonItem
//    }
//    //определяем сколько секций в таблице
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        sectionsArray.count
//    }
//    
//    //настраиваем строки секции (в ней хранятся 1 хедер и множество ячеек (строк))
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return sectionsArray[section].incomes.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IncomeTableViewCell", for: indexPath) as? IncomeTableViewCell
//        else {
//            return UITableViewCell()
//        }
//        
//        let income = sectionsArray[indexPath.section].incomes[indexPath.row]
//        cell.income = income
//        return cell
//    }
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        sectionsArray[section].date.toString()
//    }
////    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
////        <#code#>
////    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let sectionObject = sectionsArray[indexPath.section]
//        let income = sectionObject.incomes[indexPath.row]
//        presenter?.showIncomeDetail(income)
//    }
//    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            let sectionObject = sectionsArray[indexPath.section]
//            let incomeItem = sectionObject.incomes[indexPath.row]
//            presenter?.removeIncome(incomeItem)
//        }
//    }
//    
//@objc
//func addTapped(_ sender: Any) {
//    var addVC = AddIncomeViewController()
//    addVC.handler = { [weak self] newIncome in
//        guard let self = self else { return }
//        self.presenter?.addIncome(newIncome)
//    }
//    addVC.modalPresentationStyle = .formSheet
//    present(addVC, animated: true)
//    }
//    
//}
//
//extension IncomeListViewController: IncomeListViewProtocol {
//    
//    func showIncomes(_ sections: [SectionIncomesItem]) {
//        self.sectionsArray = sections
//    }
//    
//    func showErrorMessage(_ message: String) {
//        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(alertController, animated: true, completion: nil)
//    }
//    
//}
//
