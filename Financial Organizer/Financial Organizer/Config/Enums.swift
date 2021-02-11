//
//  Enums.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 09/02/21.
//

import Foundation

enum FormOfPayment: Int64 {
    case creditCard
    case debitCard
    case money
    
    var description: String {
        switch self {
            case .creditCard:
                return "Cartão de Crédito"
            case .debitCard:
                return "Cartão de Débito"
            case .money:
                return "Dinheiro"
        }
    }
}
