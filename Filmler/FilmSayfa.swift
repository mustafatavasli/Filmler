//
//  ContentView.swift
//  Filmler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import SwiftUI

struct FilmSayfa: View {
    
    @State private var filmlerListesi = [Filmler]()
    var kategori = Kategoriler()
    
    var body: some View {
        GeometryReader { geometry in
            let ekranGenislik = geometry.size.width
            let itemGenislik = (ekranGenislik - 40) / 2
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(filmlerListesi) { film in
                        NavigationLink(destination: FilmDetay(film: film)) {
                            FilmItem(film: film, genislik: itemGenislik)
                        }
                    }
                }
            }
            .padding(10)
            .navigationTitle("\(kategori.kategoriAd!)")
            .onAppear {
                var liste = [Filmler]()
                let k1 = Kategoriler(kategoriID: 1, kategoriAd: "Aksiyon")
                let k2 = Kategoriler(kategoriID: 2, kategoriAd: "Drama")
                let k3 = Kategoriler(kategoriID: 3, kategoriAd: "Bilim Kurgu")
                let y1 = Yonetmenler(yonetmenID: 1, yonetmenAd: "Quentin Tarantino")
                let y2 = Yonetmenler(yonetmenID: 2, yonetmenAd: "Christopher Nolan")
                let y3 = Yonetmenler(yonetmenID: 3, yonetmenAd: "Nuri Bilge Ceylan")
                let y4 = Yonetmenler(yonetmenID: 4, yonetmenAd: "Roman Polanski")
                let f1 = Filmler(filmID: 1, filmAd: "Django", filmYil: 2014, filmResim: "thy_logo", kategori: k1, yonetmen: y1)
                let f2 = Filmler(filmID: 2, filmAd: "Interstellar", filmYil: 2015, filmResim: "thy_logo", kategori: k3, yonetmen: y2)
                let f3 = Filmler(filmID: 3, filmAd: "Inception", filmYil: 2010, filmResim: "thy_logo", kategori: k3, yonetmen: y2)
                let f4 = Filmler(filmID: 4, filmAd: "Anadoluda", filmYil: 2011, filmResim: "thy_logo", kategori: k2, yonetmen: y3)
                let f5 = Filmler(filmID: 5, filmAd: "The Pianist", filmYil: 2008, filmResim: "thy_logo", kategori: k2, yonetmen: y4)
                let f6 = Filmler(filmID: 6, filmAd: "The Hateful Eight", filmYil: 2017, filmResim: "thy_logo", kategori: k1, yonetmen: y1)
                liste.append(f1)
                liste.append(f2)
                liste.append(f3)
                liste.append(f4)
                liste.append(f5)
                liste.append(f6)
                
                let finalListe = liste.filter({ $0.kategori!.kategoriID == kategori.kategoriID })
                
                filmlerListesi = finalListe
            }
        }
    }
}

#Preview {
    FilmSayfa()
}
