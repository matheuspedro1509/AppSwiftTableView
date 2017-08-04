//
//  ViewController.swift
//  ExemploTableView
//
//  Created by Usuário Convidado on 04/08/17.
//  Copyright © 2017 Matheus Santana. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var animal = ["Elefante", "Girafa", "Rino", "Urso" , "Leao"]
    var fotos = [#imageLiteral(resourceName: "ele"),#imageLiteral(resourceName: "girafa"),#imageLiteral(resourceName: "rino"),#imageLiteral(resourceName: "urso"),#imageLiteral(resourceName: "leao")]
    
    
    @IBOutlet weak var minhaTabela: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animal.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        //cell.textLabel?.text = "Item número: \(indexPath.row)"
        cell.textLabel?.text = animal[indexPath.row]
        cell.imageView?.image = fotos[indexPath.row]
        //cell.textLabel?.text = "Clique aqui"
        cell.detailTextLabel?.text = "Salve"
        cell.accessoryType = .disclosureIndicator
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minhaTabela.dataSource = self
        minhaTabela.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alerta = UIAlertController(
            title: "Atenção",
            message: "Selecionamos o animal: \(animal[indexPath.row])",
            preferredStyle: UIAlertControllerStyle.alert)
        alerta.addAction(UIAlertAction(
            title: "Ok",
            style: UIAlertActionStyle.default,
            handler: nil))
        present(alerta, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let barra = UIImageView(image: #imageLiteral(resourceName: "rodape"))
        return barra
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cabec = UIImageView(image: UIImage(named: "cabecalho.png"))
        return cabec
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

