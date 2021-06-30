//
//  TableHeaderView.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 09/02/21.
//

import UIKit

class TableHeaderView: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lançamentos"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.tableTextWhite
        
        return label
    }()
    
    lazy var viewAllButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ver todos", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .subheadline)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TableHeaderView: ViewCode {
    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(viewAllButton)
    }
    
    func setUpLayoutConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            viewAllButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            viewAllButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
    
    func aditionalConfigurations() {
        self.backgroundColor = UIColor.backgroundGrey
    }
    
}
