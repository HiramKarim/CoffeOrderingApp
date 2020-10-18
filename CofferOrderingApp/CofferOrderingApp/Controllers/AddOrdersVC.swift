//
//  AddOrdersVC.swift
//  CofferOrderingApp
//
//  Created by Hiram Castro on 10/17/20.
//

import UIKit

class AddOrdersVC: UIViewController {
    
    @IBOutlet weak var ordersListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ordersListTable.delegate = self
        ordersListTable.dataSource = self
    }

}

extension AddOrdersVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.backgroundColor = .red
        return cell
    }

}
