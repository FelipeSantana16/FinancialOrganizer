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

    }
    
    func aditionalConfigurations() {
        self.backgroundColor = .white
    }
    
}
