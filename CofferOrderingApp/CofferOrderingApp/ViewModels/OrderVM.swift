//
//  OrderVM.swift
//  CofferOrderingApp
//
//  Created by Hiram Castro on 10/24/20.
//

import Foundation


class OrderListVM {
    var ordersVM: [OrderVM]
    
    init() {
        ordersVM = [OrderVM]()
    }
    
    func orderViewModel(at index: Int) -> OrderVM {
        return self.ordersVM[index]
    }
}

struct OrderVM {
    let order:Order?
    
    var name:String {
        return self.order?.name ?? ""
    }
    
    var email:String {
        return self.order?.email ?? ""
    }
    
    var type:String {
        return self.order?.type?.rawValue.capitalized ?? ""
    }
    
    var size:String {
        return self.order?.size?.rawValue.capitalized ?? ""
    }
}
