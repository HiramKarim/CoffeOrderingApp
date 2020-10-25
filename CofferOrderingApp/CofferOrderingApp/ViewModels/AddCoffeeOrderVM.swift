//
//  AddCoffeeOrderVM.swift
//  CofferOrderingApp
//
//  Created by Hiram Castro on 10/24/20.
//

import Foundation

struct AddCoffeeOrderVM {
    
    var name:String?
    var email:String?
    
    var tyes:[String] {
        return CoffeType.allCases.map({
            $0.rawValue.capitalized
        })
    }
    
    var sizes: [String] {
        return CoffeSize.allCases.map({
            $0.rawValue.capitalized
        })
    }
    
}
