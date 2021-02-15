//
//  NewIncomeView.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 10/02/21.
//

import UIKit

class NewIncomeView: UIView {
    
    // MARK: Value Title
    lazy var valueTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "Valor?"
        label.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        label.textColor = UIColor.textDarkGrey
        
        return label
    }()
    
    // MARK: Item Price
    lazy var itemPrice: UITextField = {
        let price = UITextField()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.borderStyle = .none
        price.clearsOnBeginEditing = true
        price.font = UIFont.systemFont(ofSize: 56, weight: .semibold)
        price.textColor = UIColor.textDarkGrey
        price.placeholder = "R$ 00,0"
        price.attributedPlaceholder = NSAttributedString(string: "R$ 00,0", attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeHolderWhite])
        price.keyboardType = .numberPad
        
        return price
    }()
    
    // MARK: Item Name Label
    lazy var itemNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "Qual a fonte dessa receita?"
        label.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        label.textColor = UIColor.textDarkGrey
                
        return label
    }()
    
    // MARK: Item TextField
    lazy var itemNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.borderStyle = .roundedRect
        textField.clearsOnBeginEditing = true
        textField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textField.placeholder = "Ex: Aluguel de casa"
        textField.textColor = UIColor.textDarkGrey
        textField.attributedPlaceholder = NSAttributedString(string: "Ex: Salário", attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeHolderWhite])
        
        return textField
    }()
    
    // MARK: Received Text
    lazy var receivedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "Já recebeu?"
        label.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        label.textColor = UIColor.textDarkGrey
        
        return label
        
    }()
    
    // MARK: Received Switch
    lazy var receivedSwitch: UISwitch = {
        let paidSwitch = UISwitch()
        paidSwitch.translatesAutoresizingMaskIntoConstraints = false
        paidSwitch.isOn = true
        
        return paidSwitch
    }()
    
    // MARK: Item Text Date
    lazy var itemTextDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "Quando recebu?"
        label.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        label.textColor = UIColor.textDarkGrey
        
        return label
    }()
    
    // MARK: Item Date
    lazy var itemDate: UIDatePicker = {
        let date = UIDatePicker()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.datePickerMode = .dateAndTime
        
        let locale = Locale(identifier: "pt-br")
        date.locale = locale
        date.calendar.locale = locale
        date.date = Date()
        
        return date
    }()
    
    // MARK: Fixed Income Text
    lazy var fixedIncomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "É renda fixa?"
        label.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        label.textColor = UIColor.textDarkGrey
        
        return label
        
    }()
    
    // MARK: Fixed Income Switch
    lazy var fixedIncomeSwitch: UISwitch = {
        let paidSwitch = UISwitch()
        paidSwitch.translatesAutoresizingMaskIntoConstraints = false
        paidSwitch.isOn = false
        
        return paidSwitch
    }()
    
    // MARK: Layout Subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpScreen()
    }

    // MARK: Set Up
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewIncomeView: ViewCode {
    func buildHierarchy() {
        addSubview(valueTitle)
        addSubview(itemPrice)
        addSubview(itemNameLabel)
        addSubview(itemNameTextField)
        addSubview(receivedLabel)
        addSubview(receivedSwitch)
        addSubview(itemTextDate)
        addSubview(itemDate)
        addSubview(fixedIncomeLabel)
        addSubview(fixedIncomeSwitch)
    }
    
    func setUpLayoutConstraint() {
        NSLayoutConstraint.activate([
            valueTitle.topAnchor.constraint(equalTo: self.topAnchor),
            valueTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            itemPrice.topAnchor.constraint(equalTo: valueTitle.bottomAnchor, constant: 8),
            itemPrice.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            itemNameLabel.topAnchor.constraint(equalTo: itemPrice.bottomAnchor, constant: 24),
            itemNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            itemNameTextField.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 4),
            itemNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            itemNameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            receivedLabel.topAnchor.constraint(equalTo: itemNameTextField.bottomAnchor, constant: 24),
            receivedLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            receivedSwitch.centerYAnchor.constraint(equalTo: receivedLabel.centerYAnchor),
            receivedSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            itemTextDate.topAnchor.constraint(equalTo: receivedLabel.bottomAnchor, constant: 24),
            itemTextDate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            itemDate.topAnchor.constraint(equalTo: itemTextDate.bottomAnchor, constant: 8),
            itemDate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            fixedIncomeLabel.topAnchor.constraint(equalTo: itemDate.bottomAnchor, constant: 24),
            fixedIncomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            fixedIncomeSwitch.centerYAnchor.constraint(equalTo: fixedIncomeLabel.centerYAnchor),
            fixedIncomeSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
    
    func aditionalConfigurations() {
        self.backgroundColor = .white
    }
    
}
