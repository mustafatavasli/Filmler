//
//  Filmler.swift
//  Filmler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import Foundation

class Kategoriler : Identifiable {
    var kategoriID : Int?
    var kategoriAd : String?
    
    init(kategoriID: Int, kategoriAd: String) {
        self.kategoriID = kategoriID
        self.kategoriAd = kategoriAd
    }
    
    init() {}
    
}
