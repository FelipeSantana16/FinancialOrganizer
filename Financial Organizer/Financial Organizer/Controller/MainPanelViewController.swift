//
//  MainPanelViewController.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 29/06/21.
//

import UIKit

class MainPanelViewController: UIViewController {
    
    lazy var mainPanel: MainPanelView = {
        let view = MainPanelView()
        view.tableView.delegate = self
        view.tableView.dataSource = self
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainPanel
        mainPanel.addNewEntryButton.addTarget(self, action: #selector(addNewEntry), for: .touchUpInside)
    }
    
    @objc func addNewEntry() {
        let newEntryViewController = NewEntryViewController()
        present(newEntryViewController, animated: true, completion: nil)
    }

}

extension MainPanelViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell
        
        cell.configCell(name: "Nome", price: "40", date: "29/06/21", status: true, cellType: true)
        
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
        // Chamada para mostrar dados detalhados da compra
    }
    
}
