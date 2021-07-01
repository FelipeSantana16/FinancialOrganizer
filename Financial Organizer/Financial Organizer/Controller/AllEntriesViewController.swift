//
//  AllEntriesViewController.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 01/07/21.
//

import UIKit

class AllEntriesViewController: UIViewController {
    
    lazy var allEntriesView: AllEntriesView = {
        let view = AllEntriesView()
        view.tableView.delegate = self
        view.tableView.dataSource = self
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view = allEntriesView
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
}

extension AllEntriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell
        
        cell.configCell(name: "Nome", price: "40", date: "29/06/21", status: true, cellType: true)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let tableHeader = TableHeaderView()
        tableHeader.titleLabel.text = "Todos lançamentos"
        tableHeader.viewAllButton.isHidden = true
        
        return tableHeader
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 69
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        tableView.deselectRow(at: indexPath, animated: true)
        // Chamada para mostrar dados detalhados da compra
    }
    
}
