//
//  TitlesViewController.swift
//  Ing Josue Sierra
//
//  Copyright © 2020 josue. All rights reserved.
//

import UIKit

class TitlesViewController: UIViewController {
    
    fileprivate var presenter = TitlesPresenter(titleService: TitlesService())
    fileprivate var titles = [Titles]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(viewProtocol: self)
        presenter.getTitles()
    }
    
    @IBAction func btnContinue(_ sender: Any) {
        if presenter.localTitlesSelected.isEmpty{
            presenter.verifySelected(title: "Alerta", message: "Debes seleccionar una opción", buttonTitle: "Ok")
            return
        }
        self.performSegue(withIdentifier: "segueDetail", sender: nil)
    }
    
}

extension TitlesViewController: TitleProtocol {
    
    func getTitles(_ titles: [Titles]) {
        self.titles = titles
    }
    
    func alert(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension TitlesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Seleccione una opción"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTitles", for: indexPath)
        cell.textLabel?.text = titles[indexPath.row].name
        cell.textLabel?.font = .boldSystemFont(ofSize: 22)
        cell.textLabel?.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        cell.backgroundColor = presenter.propertiesSelectTitle(title: titles[indexPath.row].name!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectTitle(name: titles[indexPath.row].name!)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailViewController
        detailVC.localTitles = presenter.localTitlesSelected
    }
    
}
