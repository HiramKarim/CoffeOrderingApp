//
//  OrdersListTVC.swift
//  CofferOrderingApp
//
//  Created by Hiram Castro on 10/17/20.
//

import UIKit

class OrdersListTVC: UITableViewController {
    
    private var orderListVM = OrderListVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(OrderCell.self, forCellReuseIdentifier: "orderCell")
        self.tableView.rowHeight = 80
        self.tableView.estimatedRowHeight = 90
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        
        populateOrders()
    }
    
    private func populateOrders() {
        WebService.shared().load(resource: Order.all) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                print("DEBUG error \(error)")
                break
            case .success(let orders):
                self.bindVM(with: orders)
                break
            }
        }
    }
    
    private func bindVM(with orders:[Order]) {
        self.orderListVM.ordersVM = orders.map(OrderVM.init)
        print("DEBUG \(self.orderListVM.ordersVM)")
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.orderListVM.ordersVM.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as? OrderCell else {
            return UITableViewCell()
        }

        let vm = self.orderListVM.orderViewModel(at: indexPath.row)
        
        cell.titleLabel.text = vm.type
        cell.descriptionLabel.text = vm.size
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
