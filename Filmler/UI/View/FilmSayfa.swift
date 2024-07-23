//
//  ContentView.swift
//  Filmler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import SwiftUI

struct FilmSayfa: View {
    
    // ViewModel Object
    @ObservedObject var viewModel = FilmSayfaViewModel()
    
    var kategori = Kategoriler()
    
    var body: some View {
        GeometryReader { geometry in
            let ekranGenislik = geometry.size.width
            let itemGenislik = (ekranGenislik - 40) / 2
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(viewModel.filmlerListesi) { film in
                        NavigationLink(destination: FilmDetay(film: film)) {
                            FilmItem(film: film, genislik: itemGenislik)
                        }
                    }
                }
            }
            .padding(10)
            .navigationTitle("\(kategori.kategoriAd!)")
            .onAppear {
                viewModel.filmleriYukle(kategori_id: kategori.kategoriID!)
            }
        }
    }
}

#Preview {
    FilmSayfa()
}
