//
//  TitlesService.swift
//  Ing Josue Sierra
//
//  Copyright © 2020 josue. All rights reserved.
//

import Foundation

class TitlesService {
    
    func getTitles(_ callBack: @escaping ([Titles]) -> Void) {
        let titles = [Titles(name: "Camara"),
                      Titles(name: "Color favorito"),
                      Titles(name: "Fecha de nacimiento"),
                      Titles(name: "Foto"),
                      Titles(name: "Nombre completo"),
                      Titles(name: "Numero telefonico"),
                      Titles(name: "Sexo")
        ]
        callBack(titles)
    }
    
}
