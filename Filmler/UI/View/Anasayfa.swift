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
                veritabaniKopyala()
                viewModel.kategorileriYukle()
            }
        }
    }
    
    func veritabaniKopyala() {
        let bundle = Bundle.main.path(forResource: "filmler", ofType: ".sqlite")
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("filmler.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: hedefYol.path) {
            print("Veritabanı Daha Önce Kopyalandı")
        } else {
            do {
                try fm.copyItem(atPath: bundle!, toPath: hedefYol.path)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    Anasayfa()
}
