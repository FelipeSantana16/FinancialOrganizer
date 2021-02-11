//
//  ViewController.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 09/02/21.
//

import UIKit

class ViewController: UIViewController {

    lazy var myPanel: NewEntryView = {
        let view = NewEntryView()

        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myPanel
        self.myPanel.segmentedControl.addTarget(self, action: #selector(handleSegmentedChange), for: .valueChanged)
    }
    
    @objc func handleSegmentedChange() {
        switch self.myPanel.segmentedControl.selectedSegmentIndex {
            case 0:
                self.myPanel.incomeView.isHidden = false
                self.myPanel.expenseView.isHidden = true
            
            case 1:
                self.myPanel.incomeView.isHidden = true
                self.myPanel.expenseView.isHidden = false
            
            default:
                self.myPanel.incomeView.isHidden = false
                self.myPanel.expenseView.isHidden = true
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.backgroundColor = .clear
        cell.textLabel?.text = "Oi"
        cell.textLabel?.textColor = UIColor.tableTextWhite
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return TableHeaderView()
    }
    
}
