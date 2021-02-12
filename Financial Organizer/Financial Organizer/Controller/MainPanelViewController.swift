//
//  MainPanelViewController.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 12/02/21.
//

import UIKit

class MainPanelViewController: UIViewController {
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func addNewEntry() {
        self.present(NewEntryViewController(), animated: true, completion: nil)
    }
    
    @objc func showIncomes() {
        let incomeExpenseHistory = IncomeExpenseHistoryViewController()
        incomeExpenseHistory.myHistory.segmentedControl.selectedSegmentIndex = 0
        let backItem = UIBarButtonItem()
        backItem.title = "Painel Principal"
        backItem.tintColor = UIColor.textDarkGrey
        navigationItem.backBarButtonItem = backItem
        
        self.navigationController?.pushViewController(incomeExpenseHistory, animated: true)
    }
    
    @objc func showExpenses() {
        let incomeExpenseHistory = IncomeExpenseHistoryViewController()
        incomeExpenseHistory.myHistory.segmentedControl.selectedSegmentIndex = 1
        let backItem = UIBarButtonItem()
        backItem.title = "Painel Principal"
        backItem.tintColor = UIColor.textDarkGrey
        navigationItem.backBarButtonItem = backItem
        
        self.navigationController?.pushViewController(incomeExpenseHistory, animated: true)
    }
    
}

extension MainPanelViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return TableHeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 69
    }
}
