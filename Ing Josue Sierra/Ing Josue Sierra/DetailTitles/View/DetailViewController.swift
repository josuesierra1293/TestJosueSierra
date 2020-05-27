//
//  DetailViewController.swift
//  Ing Josue Sierra
//
//  Copyright © 2020 josue. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var localTitles = [String]()
    var presenterDetail = PresenterDetail(service: ServiceDetail())
    var colors = [FavoriteColor]()
    var genders = [Gender]()
    var detailProtocol: TitleProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenterDetail.attachView(viewProtocol: self)
        presenterDetail.getColors()
        presenterDetail.getGenders()
        presenterDetail.attachViewCamera(viewProtocol: self)
        
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return localTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return localTitles[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenterDetail.numberRowsInSection(titleSection: localTitles[section])
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = presenterDetail.showDetailItem(tableView, indexPath, localTitles[indexPath.section],colors, gender: genders)
        return cell
    }
    
}

extension DetailViewController: DetailProtocol{
    func getGender(_ gender: [Gender]) {
        self.genders = gender
    }
    
    func getColors(_ colors: [FavoriteColor]) {
        self.colors = colors
    }
    
}

extension DetailViewController: CameraProtocol, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.allowsEditing = true
            vc.delegate = self
            self.present(vc, animated: true)
        }else{
            detailProtocol?.alert(title: "Alerta", message: "Esta opcion no esta disponible en un emulador", buttonTitle: "Ok")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "sendImage"), object: image)
        //        localCell.imgPhoto.image = image
    }
    
    
}
