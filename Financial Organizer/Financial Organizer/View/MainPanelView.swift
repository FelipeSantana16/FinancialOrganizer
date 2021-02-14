//
//  MainPanel.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 09/02/21.
//

import UIKit

class MainPanelView: UIView {

    // MARK: Month Button
    lazy var monthButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Janeiro", for: .normal)
        button.setTitleColor(UIColor.textDarkGrey, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21, weight: .medium)
        
        return button
    }()
    
    // MARK: Entry Button
    lazy var entryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor.textDarkGrey
        
        return button
    }()
    
    // MARK: Balance Title
    lazy var balanceTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Balanço Mensal"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = UIColor.textDarkGrey
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    // MARK: Balance Value
    lazy var balanceValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "R$ 1450"
        label.font = UIFont.systemFont(ofSize: 56, weight: .medium)
        label.textColor = UIColor.textDarkGrey
        
        return label
    }()
    
    // MARK: Income Background
    lazy var incomeBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.incomeGreen
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    // MARK: Expense Background
    lazy var expenseBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.expenseRed
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    // MARK: Income Value
    lazy var incomeValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "R$ +3000"
        label.font = UIFont.systemFont(ofSize: 32, weight: .regular)
        label.textColor = UIColor.white
        
        return label
    }()
    
    // MARK: Expense Value
    lazy var expenseValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "R$ -1550"
        label.font = UIFont.systemFont(ofSize: 32, weight: .regular)
        label.textColor = UIColor.white
        
        return label
    }()
    
    // MARK: Dividing Line Income
    lazy var dividingLineIncome: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    // MARK: Dividing Line Expense
    lazy var dividingLineExpense: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    // MARK: Income Label
    lazy var incomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Receitas"
        label.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        label.textColor = .white
        
        return label
    }()
    
    // MARK: Expense Label
    lazy var expenseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Despesas"
        label.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        label.textColor = .white
        
        return label
    }()
    
    // MARK: Income Button
    lazy var incomeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        
        return button
    }()
    
    // MARK: Expense Button
    lazy var expenseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        
        return button
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
        table.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
        
        return table
    }()
    
    // MARK: INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainPanelView: ViewCode {
    
    // MARK: Add Subviews
    func buildHierarchy() {
        addSubview(monthButton)
        addSubview(entryButton)
        addSubview(balanceTitleLabel)
        addSubview(balanceValueLabel)
        addSubview(incomeBackground)
        addSubview(expenseBackground)
        addSubview(incomeValueLabel)
        addSubview(expenseValueLabel)
        addSubview(dividingLineIncome)
        addSubview(dividingLineExpense)
        addSubview(incomeLabel)
        addSubview(expenseLabel)
        addSubview(incomeButton)
        addSubview(expenseButton)
        addSubview(tableView)
    }
    
    // MARK: Constraints
    func setUpLayoutConstraint() {
        NSLayoutConstraint.activate([
            monthButton.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 8),
            monthButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            entryButton.centerYAnchor.constraint(equalTo: monthButton.centerYAnchor),
            entryButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            entryButton.widthAnchor.constraint(equalToConstant: 32),
            entryButton.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            balanceTitleLabel.topAnchor.constraint(equalTo: monthButton.bottomAnchor, constant: 40),
            balanceTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            balanceValueLabel.topAnchor.constraint(equalTo: balanceTitleLabel.bottomAnchor, constant: 8),
            balanceValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            incomeBackground.topAnchor.constraint(equalTo: balanceValueLabel.bottomAnchor, constant: 32),
            incomeBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35),
            incomeBackground.widthAnchor.constraint(equalToConstant: 163),
            incomeBackground.heightAnchor.constraint(equalToConstant: 144)
        ])
        
        NSLayoutConstraint.activate([
            expenseBackground.topAnchor.constraint(equalTo: balanceValueLabel.bottomAnchor, constant: 32),
            expenseBackground.leadingAnchor.constraint(equalTo: incomeBackground.trailingAnchor, constant: 32),
            expenseBackground.widthAnchor.constraint(equalToConstant: 163),
            expenseBackground.heightAnchor.constraint(equalToConstant: 144)
        ])
        
        NSLayoutConstraint.activate([
            incomeValueLabel.topAnchor.constraint(equalTo: incomeBackground.topAnchor, constant: 40),
            incomeValueLabel.centerXAnchor.constraint(equalTo: incomeBackground.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dividingLineIncome.topAnchor.constraint(equalTo: incomeValueLabel.bottomAnchor, constant: 24),
            dividingLineIncome.centerXAnchor.constraint(equalTo: incomeBackground.centerXAnchor),
            dividingLineIncome.heightAnchor.constraint(equalToConstant: 1),
            dividingLineIncome.widthAnchor.constraint(equalTo: incomeBackground.widthAnchor, multiplier: 0.85)
        ])
        
        NSLayoutConstraint.activate([
            incomeLabel.topAnchor.constraint(equalTo: dividingLineIncome.bottomAnchor, constant: 8),
            incomeLabel.centerXAnchor.constraint(equalTo: incomeBackground.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            expenseValueLabel.topAnchor.constraint(equalTo: expenseBackground.topAnchor, constant: 40),
            expenseValueLabel.centerXAnchor.constraint(equalTo: expenseBackground.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dividingLineExpense.topAnchor.constraint(equalTo: expenseValueLabel.bottomAnchor, constant: 24),
            dividingLineExpense.centerXAnchor.constraint(equalTo: expenseBackground.centerXAnchor),
            dividingLineExpense.heightAnchor.constraint(equalToConstant: 1),
            dividingLineExpense.widthAnchor.constraint(equalTo: expenseBackground.widthAnchor, multiplier: 0.85)
        ])
        
        NSLayoutConstraint.activate([
            expenseLabel.topAnchor.constraint(equalTo: dividingLineExpense.bottomAnchor, constant: 8),
            expenseLabel.centerXAnchor.constraint(equalTo: expenseBackground.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            incomeButton.centerYAnchor.constraint(equalTo: incomeBackground.centerYAnchor),
            incomeButton.centerXAnchor.constraint(equalTo: incomeBackground.centerXAnchor),
            incomeButton.heightAnchor.constraint(equalTo: incomeBackground.heightAnchor),
            incomeButton.widthAnchor.constraint(equalTo: incomeBackground.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            expenseButton.centerYAnchor.constraint(equalTo: expenseBackground.centerYAnchor),
            expenseButton.centerXAnchor.constraint(equalTo: expenseBackground.centerXAnchor),
            expenseButton.heightAnchor.constraint(equalTo: expenseBackground.heightAnchor),
            expenseButton.widthAnchor.constraint(equalTo: expenseBackground.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: incomeBackground.bottomAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    // MARK: Aditional Configs
    func aditionalConfigurations() {
        backgroundColor = .white
    }
    
}
