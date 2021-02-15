//
//  MainPanelViewController.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 12/02/21.
//

import UIKit

class MainPanelViewController: UIViewController {
    
    var panelViewModel = MainPanelViewModel()
    
    lazy var myPanel: MainPanelView = {
        let view = MainPanelView()
        view.tableView.delegate = self
        view.tableView.dataSource = self
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = myPanel
        self.myPanel.entryButton.addTarget(self, action: #selector(addNewEntry), for: .touchUpInside)
        self.myPanel.incomeButton.addTarget(self, action: #selector(showIncomes), for: .touchUpInside)
        self.myPanel.expenseButton.addTarget(self, action: #selector(showExpenses), for: .touchUpInside)
        
        panelViewModel.updateEntries()
        
        myPanel.balanceValueLabel.text = "R$ " +  String(panelViewModel.getBalance())
        
        myPanel.expenseValueLabel.text = "R$ " +  String(panelViewModel.expensesViewModel.getTotalExpense())
        
        myPanel.incomeValueLabel.text = "R$ " +  String(panelViewModel.incomesViewModel.getTotalIncome())
        //aqui deve ter uma chamada do tipo "alimentarTable" que pode ser MainPanelViewModel.getTableData
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    @objc func addNewEntry() {
        let controller = NewEntryViewController()
        controller.callback = {
            
            DispatchQueue.main.async {
                
                self.panelViewModel.updateEntries()
                self.myPanel.tableView.reloadData()
                self.myPanel.balanceValueLabel.text = "R$ " +  String(self.panelViewModel.getBalance())
                
                self.myPanel.expenseValueLabel.text = "R$ " +  String(self.panelViewModel.expensesViewModel.getTotalExpense())
                
                self.myPanel.incomeValueLabel.text = "R$ " +  String(self.panelViewModel.incomesViewModel.getTotalIncome())
                
            }
            
        }
        
        self.present(controller, animated: true, completion: nil)
        
    }
    
    @objc func showIncomes() {
        let incomeExpenseHistory = IncomeExpenseHistoryViewController()
        incomeExpenseHistory.setViewData(cellData: self.panelViewModel.incomesViewModel.getIncomesForCell(), entryType: "Receita total:", entryValue: "R$ " + String(self.panelViewModel.incomesViewModel.getTotalIncome()))
        let backItem = UIBarButtonItem()
        backItem.title = "Painel Principal"
        backItem.tintColor = UIColor.textDarkGrey
        navigationItem.backBarButtonItem = backItem
        
        self.navigationController?.pushViewController(incomeExpenseHistory, animated: true)
    }
    
    @objc func showExpenses() {
        let incomeExpenseHistory = IncomeExpenseHistoryViewController()
        incomeExpenseHistory.setViewData(cellData: self.panelViewModel.expensesViewModel.getExpensesForCell(), entryType: "Despesa total:", entryValue: "R$ " + String(self.panelViewModel.expensesViewModel.getTotalExpense()))
        let backItem = UIBarButtonItem()
        backItem.title = "Painel Principal"
        backItem.tintColor = UIColor.textDarkGrey
        navigationItem.backBarButtonItem = backItem
        
        self.navigationController?.pushViewController(incomeExpenseHistory, animated: true)
    }
    
}

extension MainPanelViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return panelViewModel.entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell
        
        let cellData = panelViewModel.entries[indexPath.row]
        
        //Passar cellData inteiro e dentro da config fazer essas atribuições
        cell.configCell(name: cellData.itemName, price: cellData.itemPrice, date: cellData.itemDate, status: cellData.itemStatus, cellType: cellData.expenseType)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return TableHeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 69
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        //Chamada para mostrar dados detalhados da compra
    }
}
