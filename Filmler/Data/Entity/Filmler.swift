//
//  Filmler.swift
//  Filmler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import Foundation

class Filmler : Identifiable {
    var filmID : Int?
    var filmAd : String?
    var filmYil : Int?
    var filmResim : String?
    // Composition
    var kategori : Kategoriler?
    var yonetmen : Yonetmenler?
    
    init(filmID: Int, filmAd: String, filmYil: Int, filmResim: String, kategori: Kategoriler, yonetmen: Yonetmenler) {
        self.filmID = filmID
        self.filmAd = filmAd
        self.filmYil = filmYil
        self.filmResim = filmResim
        self.kategori = kategori
        self.yonetmen = yonetmen
    }
    
    init() {}
    
}
