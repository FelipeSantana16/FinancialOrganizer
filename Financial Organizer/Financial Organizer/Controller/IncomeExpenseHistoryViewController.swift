//
//  IncomeExpenseHistoryViewController.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 12/02/21.
//

import UIKit

class IncomeExpenseHistoryViewController: UIViewController {
    
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
    }
    
    @objc func handleSegmented() {
        
    }

}

extension IncomeExpenseHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell
        
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
