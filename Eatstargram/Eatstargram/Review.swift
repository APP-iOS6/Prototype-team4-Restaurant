//
//  Review.swift
//  Eatstargram
//
//  Created by 강승우 on 2024/08/27.
//

import Foundation
import UIKit

struct Review {
    var id = UUID()
    var name: String
    var visitCnt : Int
    var point : Double
    var image: UIImage?
    var content: String
    
    init(name: String, visitCnt: Int, point: Double, image: UIImage? = nil, content: String) {
        self.name = name
        self.visitCnt = visitCnt
        self.point = point
        self.image = image
        self.content = content
    }
}
