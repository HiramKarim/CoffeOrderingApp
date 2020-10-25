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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ordersListTable.delegate = self
        ordersListTable.dataSource = self
        
        self.ordersListTable.rowHeight = 50
        self.ordersListTable.estimatedRowHeight = 60
        self.ordersListTable.estimatedRowHeight = UITableView.automaticDimension
        
        populateSegmentedControl()
    }
    
    private func populateSegmentedControl() {
        for (index, item) in addCoffeeOrderVM.sizes.enumerated() {
            CoffeeSizeSegmentedControl.setTitle(item, forSegmentAt: index)
        }
    }
    
    @IBAction func SaveButtonPressed(_ sender: Any) {
        
    }
    
}

extension AddOrdersVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addCoffeeOrderVM.tyes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.addCoffeeOrderVM.tyes[indexPath.row]
        return cell
    }

}
