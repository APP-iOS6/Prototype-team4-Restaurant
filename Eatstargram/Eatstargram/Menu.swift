//
//  Menu.swift
//  Eatstargram
//
//  Created by 강승우 on 2024/08/27.
//

import Foundation

struct Menu {
    var id = UUID()
    var name : String
    var price : Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
}
