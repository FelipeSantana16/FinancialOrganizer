//
//  NewEntryViewController.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 12/02/21.
//

import UIKit

class NewEntryViewController: UIViewController {

    lazy var entryView: NewEntryView = {
        let view = NewEntryView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = entryView
        self.entryView.segmentedControl.addTarget(self, action: #selector(handleSegmentedChange), for: .valueChanged)
        self.entryView.cancelButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        self.entryView.registerButton.addTarget(self, action: #selector(addEntry), for: .touchUpInside)
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addEntry() {
        
//        //Verificar segmentedControl
//        let index = self.entryView.segmentedControl.selectedSegmentIndex
//
//        let expensesView = self.entryView.expenseView
//        //let incomeView = self.entryView.incomeView
//
//        if index == 0 {
//            var newExpense = ExpenseDTO()
//            newExpense.price = expensesView.itemPrice.text ?? "00.0"
//            newExpense.name = expensesView.itemName.text ?? ""
//            newExpense.date = expensesView.itemDate.date
//            newExpense.local = expensesView.localTextField.text ?? ""
//            newExpense.paid = expensesView.paidSwitch.isOn
//            newExpense.paidMethod = expensesView.paidMethodTextField.text ?? ""
//            newExpense.fixExpese = expensesView.fixExpenseSwitch.isOn
//
//            _ = self.expenseViewModel.create(expenseDTO: newExpense)
//            self.dismiss(animated: true, completion: nil)
//
//        } else {
//
//        }
        //Parse dos dados da tela para os dados aceitos no CoreData - ViewModel
        //Salvar no CoreData

    }
    
    @objc func handleSegmentedChange() {
        switch self.entryView.segmentedControl.selectedSegmentIndex {
            case 0:
                self.entryView.incomeView.isHidden = false
                self.entryView.expenseView.isHidden = true
            
            case 1:
                self.entryView.incomeView.isHidden = true
                self.entryView.expenseView.isHidden = false
            
            default:
                self.entryView.incomeView.isHidden = false
                self.entryView.expenseView.isHidden = true
        }
    }
    
}
