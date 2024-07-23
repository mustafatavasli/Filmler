//
//  KategoriItem.swift
//  Filmler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import SwiftUI

struct KategoriItem: View {
    
    var kategori = Kategoriler()
    
    var body: some View {
        Text(kategori.kategoriAd!)
    }
}

#Preview {
    KategoriItem()
}
