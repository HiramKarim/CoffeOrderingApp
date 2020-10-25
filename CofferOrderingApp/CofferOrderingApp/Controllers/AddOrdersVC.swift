//
//  AddOrdersVC.swift
//  CofferOrderingApp
//
//  Created by Hiram Castro on 10/17/20.
//

import UIKit

class AddOrdersVC: UIViewController {
    
    @IBOutlet weak var ordersListTable: UITableView!
    @IBOutlet weak var CoffeeSizeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var NameTextfield: UITextField!
    @IBOutlet weak var EmailTextfield: UITextField!
    
    private var addCoffeeOrderVM = AddCoffeeOrderVM()
    
    private var keyboardHelper: KeyboardHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ordersListTable.delegate = self
        ordersListTable.dataSource = self
        
        self.ordersListTable.rowHeight = 50
        self.ordersListTable.estimatedRowHeight = 60
        self.ordersListTable.estimatedRowHeight = UITableView.automaticDimension
        
        populateSegmentedControl()
        setupPrivateKeyboardHelper()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTouchOnView))
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
        
        self.view.isUserInteractionEnabled = true
    }
    
    private func populateSegmentedControl() {
        for (index, item) in addCoffeeOrderVM.sizes.enumerated() {
            CoffeeSizeSegmentedControl.setTitle(item, forSegmentAt: index)
        }
    }
    
    private func setupPrivateKeyboardHelper() {
        keyboardHelper = KeyboardHelper {
            [unowned self] animation, keyboardFrame, duration in
            switch animation {
            case .keyboardWillShow:
                self.keyboardWillAppear(keyboardFrame: keyboardFrame)
                break
            case .keyboardWillHide:
                break
            }
        }
    }
    
    private func keyboardWillAppear(keyboardFrame:CGRect) {
        if view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardFrame.height
        }
    }

    private func keyboardWillDisappear() {
        if view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
            self.NameTextfield.resignFirstResponder()
            self.EmailTextfield.resignFirstResponder()
        }
    }
    
    @objc private func handleTouchOnView() {
        keyboardWillDisappear()
    }
    
    @IBAction func SaveButtonPressed(_ sender: Any) {
        
        let customerName = NameTextfield.text
        let customerEmail = EmailTextfield.text
        let selectedSize = addCoffeeOrderVM.sizes[CoffeeSizeSegmentedControl.selectedSegmentIndex]
        let selectedCoffeeType = addCoffeeOrderVM.tyes[0]
        
    }
    
}

extension AddOrdersVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addCoffeeOrderVM.tyes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.addCoffeeOrderVM.tyes[indexPath.row]
        return cell
    }

}

extension AddOrdersVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
}
