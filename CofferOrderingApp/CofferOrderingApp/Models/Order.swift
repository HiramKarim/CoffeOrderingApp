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
    case Medium
    case Large
}

struct Order: Codable {
    let name:String?
    let email:String?
    let type:CoffeType?
    let size:CoffeSize?
}
