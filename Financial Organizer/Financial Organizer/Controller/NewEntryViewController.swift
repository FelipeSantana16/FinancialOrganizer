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
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
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
