//
//  TitlesPresenter.swift
//  Ing Josue Sierra
//
//  Copyright © 2020 josue. All rights reserved.
//

import Foundation
import UIKit

protocol TitleProtocol: NSObjectProtocol {
    func getTitles(_ titles:[Titles])
    func alert(title: String, message: String, buttonTitle: String)
}

class TitlesPresenter {
    
    fileprivate let titleService: TitlesService
    weak private var titlesProtocol: TitleProtocol?
    var localTitlesSelected = [String]()
    
    init(titleService: TitlesService) {
        self.titleService = titleService
    }
    
    func attachView(viewProtocol: TitleProtocol){
        self.titlesProtocol = viewProtocol
    }
    
    func detachView(){
        self.titlesProtocol = nil
    }
    
    func getTitles() {
        titleService.getTitles {  [weak self] titles in
            self?.titlesProtocol?.getTitles(titles)
        }
    }
    
    func verifySelected(title: String, message: String, buttonTitle: String){
        titlesProtocol?.alert(title: title, message: message, buttonTitle: buttonTitle)
    }
    
    func selectTitle(name: String){
        if localTitlesSelected.contains(name){
            let index = localTitlesSelected.firstIndex(of: name)
            localTitlesSelected.remove(at: index!)
        }else{
            localTitlesSelected.append(name)
        }
        propertiesSelectTitle(title: name)
    }
    
    func propertiesSelectTitle(title: String)-> UIColor{
        if localTitlesSelected.contains(title){
            return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 0.2068739513)
        }
        return .white
    }
}
