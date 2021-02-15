//
//  IncomeExpenseHistoryViewController.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 12/02/21.
//

import UIKit

class IncomeExpenseHistoryViewController: UIViewController {
        
    var tableData = [CellDTO]()
    
    lazy var myHistory: IncomeAndExpensesHistoryView = {
        let view = IncomeAndExpensesHistoryView()
        view.tableView.delegate = self
        view.tableView.dataSource = self
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = myHistory
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    func setViewData(cellData: [CellDTO], entryType: String, entryValue: String) {
        
        self.tableData = cellData
        self.myHistory.incomeExpenseLabel.text = entryType
        self.myHistory.incomeExpenseValue.text = entryValue
        
    }

}

extension IncomeExpenseHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell
        
        let data = tableData[indexPath.row]
        
        cell.configCell(name: data.itemName, price: data.itemPrice, date: data.itemDate, status: data.itemStatus, cellType: data.expenseType)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TableHeaderView()
        header.titleLabel.text = "Histórico"
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 69
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        //Chamada para mostrar dados detalhados da compra
        
    }
}
