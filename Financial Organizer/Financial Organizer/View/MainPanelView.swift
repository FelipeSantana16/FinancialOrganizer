//
//  MainPanel.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 09/02/21.
//

import UIKit

class MainPanelView: UIView {

    // MARK: Select Month Button
    lazy var selectMonthButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor.textDarkGrey
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.setTitle("Junho", for: .normal)
        button.setTitleColor(UIColor.textDarkGrey, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21, weight: .medium)
        button.semanticContentAttribute = .forceRightToLeft
        
        return button
    }()
    
    // MARK: Add New Entry Button
    lazy var addNewEntryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor.systemBlue
        
        return button
    }()
    
    // MARK: Actual Month Balance Title
    lazy var actualMonthBalanceTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Balanço Mensal"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = UIColor.textDarkGrey
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    // MARK: Balance Value
    lazy var balanceValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ 1450"
        label.font = UIFont.systemFont(ofSize: 56, weight: .medium)
        label.textColor = UIColor.textDarkGrey
        
        return label
    }()
    
    // MARK: Incomes View Shape Background
    lazy var incomesViewShapeBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.incomeGreen
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    // MARK: Expense View Shape Background
    lazy var expensesViewShapeBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.expenseRed
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    // MARK: Incomes Value Label
    lazy var incomesValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ +3000"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = UIColor.white
        
        return label
    }()
    
    // MARK: Expense Value Label
    lazy var expensesValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ -1550"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = UIColor.white
        
        return label
    }()
    
    // MARK: Income View Category Label
    lazy var incomesViewCategoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Receitas"
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .white
        
        return label
    }()
    
    // MARK: Dividing Line Income
    lazy var dividingLineIncome: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    // MARK: Expense View Category Label
    lazy var expensesViewCategoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Despesas"
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .white
        
        return label
    }()
    
    // MARK: Dividing Line Expense
    lazy var dividingLineExpense: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        
        return view
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
        table.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
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
        addSubview(selectMonthButton)
        addSubview(addNewEntryButton)
        addSubview(actualMonthBalanceTitleLabel)
        addSubview(balanceValueLabel)
        addSubview(incomesViewShapeBackground)
        addSubview(expensesViewShapeBackground)
        addSubview(incomesValueLabel)
        addSubview(expensesValueLabel)
        addSubview(incomesViewCategoryLabel)
        addSubview(expensesViewCategoryLabel)
        addSubview(dividingLineIncome)
        addSubview(dividingLineExpense)
        addSubview(tableView)
    }
    
    // MARK: Constraints
    func setUpLayoutConstraint() {
        NSLayoutConstraint.activate([
            selectMonthButton.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 8),
            selectMonthButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addNewEntryButton.centerYAnchor.constraint(equalTo: selectMonthButton.centerYAnchor),
            addNewEntryButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            addNewEntryButton.widthAnchor.constraint(equalToConstant: 32),
            addNewEntryButton.heightAnchor.constraint(equalToConstant: 32)
        ])

        NSLayoutConstraint.activate([
            actualMonthBalanceTitleLabel.topAnchor.constraint(equalTo: selectMonthButton.bottomAnchor, constant: 40),
            actualMonthBalanceTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35)
        ])

        NSLayoutConstraint.activate([
            balanceValueLabel.topAnchor.constraint(equalTo: actualMonthBalanceTitleLabel.bottomAnchor, constant: 8),
            balanceValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35)
        ])

        NSLayoutConstraint.activate([
            incomesViewShapeBackground.topAnchor.constraint(equalTo: balanceValueLabel.bottomAnchor, constant: 32),
            incomesViewShapeBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            incomesViewShapeBackground.widthAnchor.constraint(equalToConstant: 163),
            incomesViewShapeBackground.heightAnchor.constraint(equalToConstant: 144)
        ])

        NSLayoutConstraint.activate([
            expensesViewShapeBackground.topAnchor.constraint(equalTo: balanceValueLabel.bottomAnchor, constant: 32),
            expensesViewShapeBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            expensesViewShapeBackground.widthAnchor.constraint(equalToConstant: 163),
            expensesViewShapeBackground.heightAnchor.constraint(equalToConstant: 144)
        ])

        NSLayoutConstraint.activate([
            incomesValueLabel.centerYAnchor.constraint(equalTo: incomesViewShapeBackground.centerYAnchor),
            incomesValueLabel.centerXAnchor.constraint(equalTo: incomesViewShapeBackground.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            incomesViewCategoryLabel.bottomAnchor.constraint(equalTo: incomesViewShapeBackground.bottomAnchor, constant: -8),
            incomesViewCategoryLabel.centerXAnchor.constraint(equalTo: incomesViewShapeBackground.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            dividingLineIncome.bottomAnchor.constraint(equalTo: incomesViewCategoryLabel.topAnchor, constant: -4),
            dividingLineIncome.centerXAnchor.constraint(equalTo: incomesViewShapeBackground.centerXAnchor),
            dividingLineIncome.heightAnchor.constraint(equalToConstant: 1),
            dividingLineIncome.widthAnchor.constraint(equalTo: incomesViewShapeBackground.widthAnchor, multiplier: 0.85)
        ])

        NSLayoutConstraint.activate([
            expensesValueLabel.centerYAnchor.constraint(equalTo: expensesViewShapeBackground.centerYAnchor),
            expensesValueLabel.centerXAnchor.constraint(equalTo: expensesViewShapeBackground.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            expensesViewCategoryLabel.bottomAnchor.constraint(equalTo: expensesViewShapeBackground.bottomAnchor, constant: -4),
            expensesViewCategoryLabel.centerXAnchor.constraint(equalTo: expensesViewShapeBackground.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            dividingLineExpense.bottomAnchor.constraint(equalTo: expensesViewCategoryLabel.topAnchor, constant: -8),
            dividingLineExpense.centerXAnchor.constraint(equalTo: expensesViewShapeBackground.centerXAnchor),
            dividingLineExpense.heightAnchor.constraint(equalToConstant: 1),
            dividingLineExpense.widthAnchor.constraint(equalTo: expensesViewShapeBackground.widthAnchor, multiplier: 0.85)
        ])

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: incomesViewShapeBackground.bottomAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
    
    // MARK: Aditional Configs
    func aditionalConfigurations() {
        backgroundColor = .white
    }
    
}
