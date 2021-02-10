//
//  ViewCode.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 09/02/21.
//

import Foundation

protocol ViewCode {
    func buildHierarchy()
    func setUpLayoutConstraint()
    func aditionalConfigurations()
}

extension ViewCode {
    func setUpScreen() {
        buildHierarchy()
        setUpLayoutConstraint()
        aditionalConfigurations()
    }
}
