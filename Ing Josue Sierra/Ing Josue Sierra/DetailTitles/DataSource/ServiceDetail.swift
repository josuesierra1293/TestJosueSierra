//
//  ServiceDetail.swift
//  Ing Josue Sierra
//
//  Copyright © 2020 josue. All rights reserved.
//

import Foundation

class ServiceDetail {
    
    func getColors(_ callBack: @escaping ([FavoriteColor]) -> Void) {
        let colors = [FavoriteColor(name: "Rojo", color: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)),
                      FavoriteColor(name: "Azul", color: #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)),
                      FavoriteColor(name: "Verde", color: #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)),
                      FavoriteColor(name: "Naranja", color: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)),
                      FavoriteColor(name: "Morado", color: #colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 1)),
        ]
        callBack(colors)
    }
    
    func getGenders(_ callBack: @escaping ([Gender]) -> Void) {
        let genders = [ Gender(name: "Masculino"),
                        Gender(name: "Femenino")
        ]
        callBack(genders)
    }
}
