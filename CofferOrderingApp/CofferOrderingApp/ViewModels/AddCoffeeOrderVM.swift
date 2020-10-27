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
    
    var selectedType:String?
    var selectedSize:String?
    
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
    
    mutating func setUserInfo(userName:String, userEmail:String, coffeeSize:String, coffeeType:String) {
        self.name = userName
        self.email = userEmail
        self.selectedSize = coffeeSize
        self.selectedType = coffeeType
    }
    
}
