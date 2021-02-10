//
//  NewEntryView.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 09/02/21.
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
        control.selectedSegmentIndex = 1
        
        
        return control
    }()
    
    // MARK: Value Title
    lazy var valueTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "Quanto custou?"
        label.font = UIFont.systemFont(ofSize: 56, weight: .semibold)
        label.textColor = UIColor.textDarkGrey
        
        return label
    }()
    
    // MARK: Item Price
    lazy var itemPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "R$ 00,0"
        label.font = UIFont.systemFont(ofSize: 56, weight: .semibold)
        label.textColor = UIColor.textDarkGrey
        
        return label
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
        textField.borderStyle = .line
        textField.clearsOnBeginEditing = true
        textField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textField.textColor = UIColor.placeHolderWhite
        
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
        textField.borderStyle = .line
        textField.clearsOnBeginEditing = true
        textField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textField.textColor = UIColor.placeHolderWhite
        
        return textField
    }()
    
    // MARK: Paid Text
    lazy var paidLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "Já comprou?"
        label.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        label.textColor = UIColor.textDarkGrey
        
        return label
        
    }()
    
    // MARK: Paid Switch
    lazy var paidSwitch: UISwitch = {
        let paidSwitch = UISwitch()
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
        textField.borderStyle = .line
        textField.clearsOnBeginEditing = true
        textField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textField.textColor = UIColor.placeHolderWhite
        
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
        paidSwitch.isOn = false
        
        return paidSwitch
    }()
}

extension NewEntryView: ViewCode {
    
    // MARK: Build Hierarchy
    func buildHierarchy() {
        addSubview(cancelButton)
//        addSubview(registerButton)
//        addSubview(segmentedControl)
//        addSubview(valueTitle)
//        addSubview(itemPrice)
//        addSubview(itemName)
//        addSubview(itemNameTextField)
//        addSubview(itemTextDate)
//        addSubview(itemDate)
//        addSubview(localLabel)
//        addSubview(localTextField)
//        addSubview(paidLabel)
//        addSubview(paidSwitch)
//        addSubview(paidMethodLabel)
//        addSubview(paidMethodTextField)
//        addSubview(fixExpenseLabel)
//        addSubview(fixExpenseSwitch)
    }
    
    // MARK: Constraints
    func setUpLayoutConstraint() {
        
    }
    
    // MARK: Aditional Configs
    func aditionalConfigurations() {
        self.backgroundColor = .white
    }
    
    
    
}
