//
//  NewEntryView.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 11/02/21.
//

import UIKit

class NewEntryView: UIView {

    // MARK: Cancel Button
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancelar", for: .normal)
        button.setTitleColor(UIColor.textDarkGrey, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
        return button
    }()
    
    // MARK: Register button
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrar", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        return button
    }()
    
    // MARK: Segmented Control
    lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.insertSegment(withTitle: "Receita", at: 0, animated: true)
        control.insertSegment(withTitle: "Despesa", at: 1, animated: true)
        control.selectedSegmentIndex = 0
        
        return control
    }()
    
    lazy var incomeView: NewIncomeView = {
        let incomeView = NewIncomeView()
        incomeView.translatesAutoresizingMaskIntoConstraints = false
        return incomeView
    }()
    
    lazy var expenseView: NewExpenseView = {
        let expenseView = NewExpenseView()
        expenseView.translatesAutoresizingMaskIntoConstraints = false
        expenseView.isHidden = true
        
        return expenseView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpScreen()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NewEntryView: ViewCode {
    func buildHierarchy() {
        addSubview(cancelButton)
        addSubview(registerButton)
        addSubview(segmentedControl)
        addSubview(incomeView)
        addSubview(expenseView)
    }
    
    func setUpLayoutConstraint() {
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            cancelButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 24),
            segmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 42),
            segmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -42)
        ])
        
        NSLayoutConstraint.activate([
            incomeView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 47),
            incomeView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            incomeView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            incomeView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            expenseView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 47),
            expenseView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            expenseView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            expenseView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func aditionalConfigurations() {
        self.backgroundColor = .white
    }
    
}
