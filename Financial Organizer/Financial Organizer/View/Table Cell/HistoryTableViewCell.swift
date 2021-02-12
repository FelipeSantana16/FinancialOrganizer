//
//  HistoryTableViewCell.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 12/02/21.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    static let identifier = "HistoryTableViewCell"
    
    // MARK: - Status View
    lazy var circularView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.pendingYellow
        return view
    }()
    
    // MARK: - Status label
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pendente"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor.tableTextWhite
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    // MARK: - Item label
    lazy var itemName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cafézinho"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = UIColor.tableTextWhite
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    // MARK: - Item date
    lazy var itemDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "05 Fev"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor.tableTextWhite
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    // MARK: - Item price
    lazy var itemPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ 1,50"
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = UIColor.tableTextWhite
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpScreen()
        circularView.layer.cornerRadius = 0.5 * circularView.frame.width
    }
}

extension HistoryTableViewCell: ViewCode {
    // MARK: - Build Hierarchy
    func buildHierarchy() {
        addSubview(circularView)
        addSubview(statusLabel)
        addSubview(itemName)
        addSubview(itemDate)
        addSubview(itemPrice)
    }
    
    // MARK: - Constraints
    func setUpLayoutConstraint() {
        
        NSLayoutConstraint.activate([
            circularView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            circularView.topAnchor.constraint(equalTo: self.topAnchor, constant: 29),
            circularView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24),
            circularView.heightAnchor.constraint(equalToConstant: 16),
            circularView.widthAnchor.constraint(equalToConstant: 16)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            statusLabel.leadingAnchor.constraint(equalTo: circularView.trailingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            itemName.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 2),
            itemName.leadingAnchor.constraint(equalTo: circularView.trailingAnchor, constant: 16),
            itemName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            itemDate.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            itemDate.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            itemPrice.topAnchor.constraint(equalTo: itemDate.bottomAnchor, constant: 2),
            itemPrice.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            itemPrice.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    // MARK: - Aditional Configs
    func aditionalConfigurations() {
        self.backgroundColor = .clear
    }
    
}
