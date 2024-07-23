//
//  FilmItem.swift
//  Filmler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import SwiftUI

struct FilmItem: View {
    
    var film = Filmler()
    var genislik = 0.0
    
    var body: some View {
        VStack(spacing: 5) {
            Image(film.filmResim!)
                .resizable()
                .frame(width: genislik)
            Text(film.filmAd!)
                .foregroundStyle(.gray)
            Text("Sepete Ekle")
                .padding(5)
                .foregroundStyle(.white)
                .background(.indigo)
                .clipShape(.buttonBorder)
                .padding(.bottom, 5)
                .onTapGesture {
                    print("\(film.filmAd!) sepete eklendi.")
                }
        }
        .background(Rectangle().fill(.white).shadow(radius: 3))
    }
}

/*
#Preview {
    FilmItem()
}
*/
