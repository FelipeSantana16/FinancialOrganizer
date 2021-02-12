//
//  NewEntryView.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 09/02/21.
//

import UIKit

class NewExpenseView: UIView {
    
    // MARK: Value Title
    lazy var valueTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "Quanto custou?"
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

        return price
    }()

    // MARK: Item Name
    lazy var itemName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "O que comprou?"
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
        textField.placeholder = "Ex: Remédio"
        textField.textColor = UIColor.textDarkGrey
        textField.attributedPlaceholder = NSAttributedString(string: "Ex: Remédio", attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeHolderWhite])
        
        return textField
    }()
    
    // MARK: Item Text Date
    lazy var itemTextDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "Quando comprou?"
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
    
    // MARK: Local Label
    lazy var localLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "Onde comprou?"
        label.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        label.textColor = UIColor.textDarkGrey
        
        return label
    }()
    
    // MARK: Local TextField
    lazy var localTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.clearsOnBeginEditing = true
        textField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textField.placeholder = "Ex: Farmácia"
        textField.textColor = UIColor.textDarkGrey
        textField.attributedPlaceholder = NSAttributedString(string: "Ex: Farmácia", attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeHolderWhite])
        
        return textField
    }()
    
    // MARK: Paid Text
    lazy var paidLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "Já pagou?"
        label.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        label.textColor = UIColor.textDarkGrey
        
        return label
        
    }()
    
    // MARK: Paid Switch
    lazy var paidSwitch: UISwitch = {
        let paidSwitch = UISwitch()
        paidSwitch.translatesAutoresizingMaskIntoConstraints = false
        paidSwitch.isOn = true
        
        return paidSwitch
    }()
    
    // MARK: Paid Method Label
    lazy var paidMethodLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "Como pagou?"
        label.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        label.textColor = UIColor.textDarkGrey
        
        return label
    }()
    
    // MARK: Paid Method TextField
    lazy var paidMethodTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.clearsOnBeginEditing = true
        textField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textField.placeholder = "Ex: Cartão de Crédito"
        textField.textColor = UIColor.textDarkGrey
        textField.attributedPlaceholder = NSAttributedString(string: "Ex: Dinheiro", attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeHolderWhite])
        
        return textField
    }()
    
    // MARK: Fix Expense Text
    lazy var fixExpenseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "É despesa fixa?"
        label.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        label.textColor = UIColor.textDarkGrey
        
        return label
        
    }()
    
    // MARK: Fix Expense Switch
    lazy var fixExpenseSwitch: UISwitch = {
        let paidSwitch = UISwitch()
        paidSwitch.translatesAutoresizingMaskIntoConstraints = false
        paidSwitch.isOn = false
        
        return paidSwitch
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

extension NewExpenseView: ViewCode {
    
    // MARK: Build Hierarchy
    func buildHierarchy() {
        addSubview(valueTitle)
        addSubview(itemPrice)
        addSubview(itemName)
        addSubview(itemNameTextField)
        addSubview(itemTextDate)
        addSubview(itemDate)
        addSubview(localLabel)
        addSubview(localTextField)
        addSubview(paidLabel)
        addSubview(paidSwitch)
        addSubview(paidMethodLabel)
        addSubview(paidMethodTextField)
        addSubview(fixExpenseLabel)
        addSubview(fixExpenseSwitch)
    }
    
    // MARK: Constraints
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
            itemName.topAnchor.constraint(equalTo: itemPrice.bottomAnchor, constant: 24),
            itemName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            itemNameTextField.topAnchor.constraint(equalTo: itemName.bottomAnchor, constant: 4),
            itemNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            itemNameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            itemTextDate.topAnchor.constraint(equalTo: itemNameTextField.bottomAnchor, constant: 24),
            itemTextDate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            itemDate.topAnchor.constraint(equalTo: itemTextDate.bottomAnchor, constant: 8),
            itemDate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            localLabel.topAnchor.constraint(equalTo: itemDate.bottomAnchor, constant: 24),
            localLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            localTextField.topAnchor.constraint(equalTo: localLabel.bottomAnchor, constant: 4),
            localTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            localTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            paidLabel.topAnchor.constraint(equalTo: localTextField.bottomAnchor, constant: 24),
            paidLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            paidSwitch.centerYAnchor.constraint(equalTo: paidLabel.centerYAnchor),
            paidSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            paidMethodLabel.topAnchor.constraint(equalTo: paidLabel.bottomAnchor, constant: 24),
            paidMethodLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            paidMethodTextField.topAnchor.constraint(equalTo: paidMethodLabel.bottomAnchor, constant: 4),
            paidMethodTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            paidMethodTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            fixExpenseLabel.topAnchor.constraint(equalTo: paidMethodTextField.bottomAnchor, constant: 24),
            fixExpenseLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            fixExpenseSwitch.centerYAnchor.constraint(equalTo: fixExpenseLabel.centerYAnchor),
            fixExpenseSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
    
    // MARK: Aditional Configs
    func aditionalConfigurations() {
        self.backgroundColor = .white
     
//        let bottomLine = CALayer()
//        bottomLine.frame = CGRect(x: 0, y: itemNameTextField.frame.height - 2, width: itemNameTextField.frame.width, height: 2)
//        bottomLine.backgroundColor = UIColor.textDarkGrey.cgColor
//
//        itemNameTextField.borderStyle = UITextField.BorderStyle.none
//
//        itemNameTextField.layer.addSublayer(bottomLine)
    }
    
}
