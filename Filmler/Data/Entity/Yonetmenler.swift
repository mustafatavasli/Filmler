//
//  Yonetmenler.swift
//  Filmler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import Foundation

class Yonetmenler : Identifiable {
    var yonetmenID : Int?
    var yonetmenAd : String?
    
    init(yonetmenID: Int, yonetmenAd: String) {
        self.yonetmenID = yonetmenID
        self.yonetmenAd = yonetmenAd
    }
    
    init() {}
}
