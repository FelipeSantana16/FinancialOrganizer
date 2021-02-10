//
//  IncomeAndExpensesHistoryView.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 10/02/21.
//

import UIKit

class IncomeAndExpensesHistoryView: UIView {

    // MARK: Segmented Control
    lazy var segmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl()
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.insertSegment(withTitle: "Receita", at: 0, animated: true)
        segmented.insertSegment(withTitle: "Despesa", at: 1, animated: true)
        segmented.selectedSegmentIndex = 1
        
        return segmented
    }()
    
    // MARK: Income/Expense Label
    lazy var incomeExpenseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Receitas"
        label.font = UIFont.systemFont(ofSize: 32, weight: .regular)
        label.textColor = UIColor.textDarkGrey
        
        return label
    }()
    
    // MARK: Income/Expense Value
    lazy var incomeExpenseValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ 3000"
        label.font = UIFont.systemFont(ofSize: 29, weight: .regular)
        label.textColor = UIColor.textDarkGrey
        
        return label
    }()
    
    // MARK: Table
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor.backgroundGrey
        table.separatorColor = UIColor.tableSeparatorGray
        table.separatorInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        table.layer.cornerRadius = 24
        table.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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

extension IncomeAndExpensesHistoryView: ViewCode {
    
    // MARK: Build Hierarchy
    func buildHierarchy() {
        addSubview(segmentedControl)
        addSubview(incomeExpenseLabel)
        addSubview(incomeExpenseValue)
        addSubview(tableView)
    }
    
    // MARK: Constraints
    func setUpLayoutConstraint() {
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 8),
            segmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 42),
            segmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -42)
        ])
        
        NSLayoutConstraint.activate([
            incomeExpenseLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 24),
            incomeExpenseLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            incomeExpenseValue.centerYAnchor.constraint(equalTo: incomeExpenseLabel.centerYAnchor),
            incomeExpenseValue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: incomeExpenseLabel.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    // MARK: Aditional Config
    func aditionalConfigurations() {
        self.backgroundColor = .white
        
    }
    
}
