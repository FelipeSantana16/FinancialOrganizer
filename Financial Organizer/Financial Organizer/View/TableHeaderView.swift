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
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.tableTextWhite
        
        return label
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
    }
    
    func setUpLayoutConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    func aditionalConfigurations() {
        self.backgroundColor = UIColor.backgroundGrey
    }
    
}
