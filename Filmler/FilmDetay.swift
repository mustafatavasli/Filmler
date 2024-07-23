//
//  FilmDetay.swift
//  Filmler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import SwiftUI

struct FilmDetay: View {
    
    var film = Filmler()
    
    var body: some View {
        VStack(spacing: 50) {
            Image(film.filmResim!)
            Text(film.yonetmen!.yonetmenAd!)
                .font(.system(size: 30))
            Text(String(film.filmYil!))
                .font(.system(size: 50))
                .foregroundStyle(.blue)
            Button("Sepete Ekle") {
                print("Detay Sayfa : \(film.filmAd!) sepete eklendi.")
            }
            .foregroundStyle(.white)
            .frame(width: 250, height: 50)
            .background(.indigo)
            .clipShape(.buttonBorder)
        }
        .navigationTitle("\(film.filmAd!)")
    }
}

/*
#Preview {
    FilmDetay()
}
*/
