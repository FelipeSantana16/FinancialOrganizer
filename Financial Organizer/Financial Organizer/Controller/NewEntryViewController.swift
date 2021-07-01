//
//  NewEntryViewController.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 01/07/21.
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
        
        self.entryView.expenseView.localTextField.addTarget(self, action: #selector(keyboardWillShow), for: .editingDidBegin)
        self.entryView.expenseView.localTextField.addTarget(self, action: #selector(keyboardWillHide), for: .editingDidEnd)
        self.entryView.expenseView.paidMethodTextField.addTarget(self, action: #selector(keyboardWillShow), for: .editingDidBegin)
        self.entryView.expenseView.paidMethodTextField.addTarget(self, action: #selector(keyboardWillHide), for: .editingDidEnd)
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
    
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow() {
        
        if self.view.frame.origin.y == 0 {
            if self.view.frame.height <= 680 {
                self.view.frame.origin.y -= (self.view.frame.height * 0.4)
            } else {
                self.view.frame.origin.y -= (self.view.frame.height / 4) // keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide() {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
