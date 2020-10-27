//
//  Order.swift
//  CofferOrderingApp
//
//  Created by Hiram Castro on 10/24/20.
//

import Foundation

enum CoffeType:String, Codable, CaseIterable {
    case cappucino
    case latte
    case espresso
    case cortado
}

enum CoffeSize:String, Codable, CaseIterable {
    case small
    case medium
    case large
}

struct Order: Codable {
    let name:String?
    let email:String?
    let type:CoffeType?
    let size:CoffeSize?
}

extension Order {
    init?(_ vm: AddCoffeeOrderVM) {
        
        guard let name = vm.name,
              let email = vm.email,
              let selectedType = CoffeType(rawValue: vm.selectedType?.lowercased() ?? "cappucino"),
              let selectedSize = CoffeSize(rawValue: vm.selectedSize?.lowercased() ?? "small")
        else { return nil }
        
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
}

extension Order {
    
    static var all: Resource<[Order]> = {
        guard let url = URL(string: API.coffeOrdersURL) else { fatalError("URL is incorrect!") }
        return Resource<[Order]>(url: url)
    }()
    
    static func create(vm: AddCoffeeOrderVM) -> Resource<Order?> {
        let order = Order(vm)
        guard let url = URL(string: API.coffeOrdersURL) else { fatalError("URL is incorrect!") }
        guard let data = try? JSONEncoder().encode(order) else { fatalError("Error enconding order!") }
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = .post
        resource.body = data
        return resource
    }
    
}
