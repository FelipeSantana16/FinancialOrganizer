//
//  ViewController.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 09/02/21.
//

import UIKit

class ViewController: UIViewController {

    lazy var myPanel: NewEntryView = {
        let view = NewEntryView()//MainPanelView()
//        view.tableView.delegate = self
//        view.tableView.dataSource = self
//
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myPanel
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.backgroundColor = .clear
        //cell.textLabel?.text = "Oi"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return TableHeaderView()
    }
    
}
