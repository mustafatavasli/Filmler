//
//  FilmSayfaViewModel.swift
//  Filmler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import Foundation

class FilmSayfaViewModel : ObservableObject {
    @Published var filmlerListesi = [Filmler]()
    
    let db : FMDatabase?
    
    init() {
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("filmler.sqlite")
        db = FMDatabase(path: hedefYol.path)
    }
    
    func filmleriYukle(kategori_id: Int) {
        db?.open()
        
        var liste = [Filmler]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM kategoriler, yonetmenler, filmler WHERE filmler.kategori_id = kategoriler.kategori_id and filmler.yonetmen_id = yonetmenler.yonetmen_id and filmler.kategori_id = ?", values: [kategori_id])
            
            while result.next() {
                let kategori_id = Int(result.string(forColumn: "kategori_id"))!
                let kategori_ad = result.string(forColumn: "kategori_ad")!
                
                let kategori = Kategoriler(kategoriID: kategori_id, kategoriAd: kategori_ad)
                
                let yonetmen_id = Int(result.string(forColumn: "yonetmen_id"))!
                let yonetmen_ad = result.string(forColumn: "yonetmen_ad")!
                
                let yonetmen = Yonetmenler(yonetmenID: yonetmen_id, yonetmenAd: yonetmen_ad)  
                
                let film_id = Int(result.string(forColumn: "film_id"))!
                let film_ad = result.string(forColumn: "film_ad")!
                let film_yil = Int(result.string(forColumn: "film_yil"))!
                let film_resim = result.string(forColumn: "film_resim")!
                
                let film = Filmler(filmID: film_id, filmAd: film_ad, filmYil: film_yil, filmResim: film_resim, kategori: kategori, yonetmen: yonetmen)
                
                liste.append(film)
            }
            
            filmlerListesi = liste
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
