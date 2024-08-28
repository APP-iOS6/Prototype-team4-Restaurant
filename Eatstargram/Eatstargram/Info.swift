//
//  Info.swift
//  Eatstargram
//
//  Created by 강승우 on 2024/08/28.
//

import Foundation

struct Info {
    var id = UUID()
    var image: String
    var content: String
    
    init(image: String, content: String) {
        self.image = image
        self.content = content
    }
}
