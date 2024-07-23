//
//  Anasayfa.swift
//  Filmler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import SwiftUI

struct Anasayfa: View {
    
    // ViewModel Object
    @ObservedObject var viewModel = AnasayfaViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.kategorilerListesi) { kategori in
                    NavigationLink(destination: FilmSayfa()) {
                        KategoriItem(kategori: kategori)
                    }
                }
            }
            .navigationTitle("Kategoriler")
            .onAppear {
                viewModel.kategorileriYukle()
            }
        }
    }
}

#Preview {
    Anasayfa()
}
