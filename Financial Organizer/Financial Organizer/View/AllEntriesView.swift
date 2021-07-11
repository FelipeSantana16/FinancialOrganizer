//
//  IncomeAndExpensesHistoryView.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 10/02/21.
//

import UIKit

class AllEntriesView: UIView {
    
    // MARK: Table
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor.backgroundGrey
        table.separatorColor = UIColor.tableSeparatorGray
        table.separatorInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        // table.layer.cornerRadius = 24
        // table.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        table.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
        
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AllEntriesView: ViewCode {
    
    // MARK: Build Hierarchy
    func buildHierarchy() {
        addSubview(tableView)
    }
    
    // MARK: Constraints
    func setUpLayoutConstraint() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor/*, constant: 16*/),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor/*, constant: -16*/),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    // MARK: Aditional Config
    func aditionalConfigurations() {
        self.backgroundColor = UIColor.backgroundGrey
        
    }
    
}
