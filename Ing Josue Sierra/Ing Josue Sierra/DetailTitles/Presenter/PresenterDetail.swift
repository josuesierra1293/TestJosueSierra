//
//  PresenterDetail.swift
//  Ing Josue Sierra
//
//  Copyright © 2020 josue. All rights reserved.
//

import Foundation
import UIKit

protocol DetailProtocol: NSObjectProtocol {
    func getColors(_ colors: [FavoriteColor] )
    func getGender(_ gender: [Gender])
}

protocol CameraProtocol {
    func openCamera()
}

class PresenterDetail {
    
    weak private var detailProtocol: DetailProtocol?
    fileprivate var serviceDetail: ServiceDetail?
    private var cameraProtocol: CameraProtocol?
    
    init(service: ServiceDetail) {
        self.serviceDetail = service
    }
    
    
    func showDetailItem(_ tableView: UITableView, _ indexPath: IndexPath, _ name: String, _ colors: [FavoriteColor], gender: [Gender])-> UITableViewCell{
        
        let row = indexPath.row
        let section = indexPath.section
        
        switch name {
        case "Camara":
            let cell = tableView.dequeueReusableCell(withIdentifier: "CameraCell", for: indexPath) as! CameraCell
            let tapCamera = UITapGestureRecognizer(target: self, action: #selector(openCamera(_:)))
            cell.imgPhoto.addGestureRecognizer(tapCamera)
            return cell
        case "Foto":
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
            return cell
        case "Nombre completo":
            let cell = tableView.dequeueReusableCell(withIdentifier: "FullNameCell", for: indexPath) as! FullNameCell
            return cell
        case "Numero telefonico":
            let cell = tableView.dequeueReusableCell(withIdentifier: "NumberPhoneCell", for: indexPath) as! NumberPhoneCell
            return cell
        case "Fecha de nacimiento":
            let cell = tableView.dequeueReusableCell(withIdentifier: "BirthdateCell", for: indexPath) as! BirthdateCell
            return cell
        case "Sexo":
            let cell = tableView.dequeueReusableCell(withIdentifier: "GenderCell", for: indexPath) as! GenderCell
            cell.textLabel?.text = gender[row].name
            return cell
        case "Color favorito":
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteColorCell", for: indexPath) as! FavoriteColorCell
            cell.imgCheckBox.tag = row
            cell.backgroundColor = colors[row].color
            cell.textLabel?.text = colors[row].name
            return cell
            
        default:
            break
        }
        return UITableViewCell()
    }
    
    func attachView(viewProtocol: DetailProtocol){
        self.detailProtocol = viewProtocol
    }
    
    func attachViewCamera(viewProtocol: CameraProtocol){
        self.cameraProtocol = viewProtocol
    }
    
    func getColors(){
        serviceDetail?.getColors({ colors in
            self.detailProtocol?.getColors(colors)
        })
    }
    
    func getGenders(){
        serviceDetail?.getGenders({ genders in
            self.detailProtocol?.getGender(genders)
        })
    }
    
    func numberRowsInSection(titleSection: String)-> Int{
        switch titleSection {
        case "Color favorito":
            return 5//colors.count
        case "Sexo":
            return 2
        default:
            return 1
        }
    }
    
    @objc func openCamera(_ sender: UIGestureRecognizer){
        cameraProtocol?.openCamera()
    }
    
}
