//
//  AnasayfaViewModel.swift
//  Filmler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import Foundation

class AnasayfaViewModel : ObservableObject {
    @Published var kategorilerListesi = [Kategoriler]()
    
    let db : FMDatabase?
    
    init() {
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("filmler.sqlite")
        db = FMDatabase(path: hedefYol.path)
    }
    
    func kategorileriYukle() {
        db?.open()
        
        var liste = [Kategoriler]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM kategoriler", values: nil)
            
            while result.next() {
                let kategori_id = Int(result.string(forColumn: "kategori_id"))!
                let kategori_ad = result.string(forColumn: "kategori_ad")!
                
                let kategori = Kategoriler(kategoriID: kategori_id, kategoriAd: kategori_ad)
                liste.append(kategori)
            }
            
            kategorilerListesi = liste
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
