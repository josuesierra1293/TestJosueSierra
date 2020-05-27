//
//  ItemsViewCell.swift
//  Ing Josue Sierra
//
//  Copyright © 2020 josue. All rights reserved.
//

import UIKit

class CameraCell: UITableViewCell {
    @IBOutlet weak var imgPhoto: UIImageView!
    
    override func awakeFromNib() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "sendImage"), object: nil, queue: nil) { (object) in
            self.imgPhoto.image = object.object as! UIImage
        }
    }
    
}

class FavoriteColorCell: UITableViewCell {
    @IBOutlet weak var imgCheckBox: UIImageView!
    
    override func awakeFromNib() {
        imgCheckBox.image = #imageLiteral(resourceName: "round_check_box_outline_blank_white_24dp")
        let tapcheckBox = UITapGestureRecognizer(target: self, action: #selector(check(_:)))
        self.imgCheckBox.addGestureRecognizer(tapcheckBox)
    }
    
    @objc func check(_ sender: UIGestureRecognizer){
        (imgCheckBox.image ==  #imageLiteral(resourceName: "round_check_box_outline_blank_white_24dp")) ? (imgCheckBox.image =  #imageLiteral(resourceName: "round_check_box_white_24dp")) : (imgCheckBox.image =  #imageLiteral(resourceName: "round_check_box_outline_blank_white_24dp"))
    }
    
}

class BirthdateCell: UITableViewCell {
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var dtPickerDate: UIDatePicker!
    
    override func awakeFromNib() {
        dtPickerDate.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        txtDate.text = formatter.string(from: sender.date)
    }
    
}

class PhotoCell: UITableViewCell {
    @IBOutlet weak var imgPicture: UIImageView!
    
    override func awakeFromNib() {
        let urlVegeta = URL(string: "https://http2.mlstatic.com/vegeta-tamano-real-para-armar-en-papercraft-D_NQ_NP_892880-MLA26232224460_102017-F.jpg")
        guard let imageData = try? Data(contentsOf: urlVegeta!) else { return }
        backgroundColor = .none
        imgPicture.image = UIImage.init(data: imageData)
    }
    
}

class FullNameCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var txtFullName: ValueTypeInputs!
    
    override func awakeFromNib() {
        txtFullName.valueType = .fullName
        txtFullName.maxLength = 35
        txtFullName.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let sdcTextField = textField as? ValueTypeInputs {
            return sdcTextField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        return false
    }
    
}

class NumberPhoneCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var txtNumberPhone: ValueTypeInputs!
    
    override func awakeFromNib() {
        txtNumberPhone.valueType = .phoneNumber
        txtNumberPhone.maxLength = 10
        txtNumberPhone.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let sdcTextField = textField as? ValueTypeInputs {
            return sdcTextField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        return false
    }
    
}

class GenderCell: UITableViewCell {
    @IBOutlet weak var imgCheckBox: UIImageView!
    
    override func awakeFromNib() {
        imgCheckBox.image = #imageLiteral(resourceName: "baseline_check_box_outline_blank_black_24dp")
        let tapcheckBox = UITapGestureRecognizer(target: self, action: #selector(check(_:)))
        self.imgCheckBox.addGestureRecognizer(tapcheckBox)
    }
    
    @objc func check(_ sender: UIGestureRecognizer){
        (imgCheckBox.image ==  #imageLiteral(resourceName: "baseline_check_box_outline_blank_black_24dp")) ? (imgCheckBox.image =  #imageLiteral(resourceName: "baseline_check_box_black_24dp")) : (imgCheckBox.image =  #imageLiteral(resourceName: "baseline_check_box_outline_blank_black_24dp"))
    }
    
    
}
