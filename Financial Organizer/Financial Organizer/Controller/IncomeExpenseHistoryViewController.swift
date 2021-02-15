//
//  IncomeExpenseHistoryViewController.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 12/02/21.
//

import UIKit

class IncomeExpenseHistoryViewController: UIViewController {
        
    let expenseViewModel = ExpenseViewModel()
    let incomeViewModel = IncomeViewModel()
    
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
        self.myHistory.segmentedControl.addTarget(self, action: #selector(handleSegmented), for: .valueChanged)
        
        expenseViewModel.getAllExpenses()
        incomeViewModel.getAllIncomes()
        
    }
    
    @objc func handleSegmented() {
        
        let segmented = myHistory.segmentedControl.selectedSegmentIndex
                
        if segmented == 0 {
            
            //Setup label, value and feed the table with incomes
            self.myHistory.incomeExpenseLabel.text = "Receita total: "
            
            self.myHistory.incomeExpenseValue.text = "R$ " +  String(incomeViewModel.getTotalIncome())
            
            DispatchQueue.main.async {
                self.myHistory.tableView.reloadData()
            }
            
        } else {
            
            //Setup label, value and feed the table with incomes
            self.myHistory.incomeExpenseLabel.text = "Despesa total: "
            
            self.myHistory.incomeExpenseValue.text = "R$ " + String(expenseViewModel.getTotalExpense())
            
            DispatchQueue.main.async {
                self.myHistory.tableView.reloadData()
            }
        }
    }

}

extension IncomeExpenseHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let index = myHistory.segmentedControl.selectedSegmentIndex
        
        if index == 0 {
            
            return self.expenseViewModel.expenses.count
            
        } else {
            
            return self.incomeViewModel.incomes.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell
        
        let index = myHistory.segmentedControl.selectedSegmentIndex
        
        var allData = [CellDTO]()
        
        if index == 0 {
            
            allData = incomeViewModel.getIncomesForCell()
            
        } else {
            
            allData = expenseViewModel.getExpensesForCell()

        }
        
        let data = allData[indexPath.row]
        
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
}
