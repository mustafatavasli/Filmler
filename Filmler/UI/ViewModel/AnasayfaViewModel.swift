//
//  AnasayfaViewModel.swift
//  Filmler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import Foundation

class AnasayfaViewModel : ObservableObject {
    @Published var kategorilerListesi = [Kategoriler]()
    
    func kategorileriYukle() {
        var liste = [Kategoriler]()
        let k1 = Kategoriler(kategoriID: 1, kategoriAd: "Aksiyon")
        let k2 = Kategoriler(kategoriID: 2, kategoriAd: "Drama")
        let k3 = Kategoriler(kategoriID: 3, kategoriAd: "Bilim Kurgu")
        liste.append(k1)
        liste.append(k2)
        liste.append(k3)
        kategorilerListesi = liste
    }
}
