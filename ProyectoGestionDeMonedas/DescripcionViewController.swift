//
//  DescripcionViewController.swift
//  ProyectoGestionDeMonedas
//
//  Created by Alexander Claude Garcia Palacios on 28/06/23.
//  Copyright © 2023 cibertec. All rights reserved.
//

import UIKit

class DescripcionViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var currencies: [Currency] = []
    var filteredCurrencies: [Currency] = []

    @IBOutlet weak var txtFiltro: UITextField!
    @IBOutlet weak var tvDescripcion: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvDescripcion.dataSource = self
        tvDescripcion.delegate = self
        
        buscar(criterio: "criterio")
    }
    
    func buscar(criterio: String) {
        let urlBase = "https://api.exchangerate.host/symbols"
        let urlConsulta = URL(string: urlBase)
        let request = URLRequest(url: urlConsulta!)
        let tarea = URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil {
                if let data = data, let currencyList = try? JSONDecoder().decode(CurrencyList.self, from: data) {
                    
                    let currencies = currencyList.symbols.values.map { $0 }
                    
                    let sortedCurrencies = currencies.sorted { $0.code < $1.code }

                    DispatchQueue.main.async {
                        
                        self.currencies = sortedCurrencies
                        self.filteredCurrencies = sortedCurrencies
                        self.tvDescripcion.reloadData()
                    }
                }
            }
        }
        tarea.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCurrencies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvDescripcion.dequeueReusableCell(withIdentifier: "desc") as! DescripcionTableViewCell
        let currency = filteredCurrencies[indexPath.row]
        cell.lblCode.text = currency.code
        cell.lblDescripcion.text = currency.description
        cell.detailTextLabel?.text = currency.code
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    

    @IBAction func btnBuscar(_ sender: UIButton) {
        let searchText = txtFiltro.text ?? ""
        
        if searchText.isEmpty {
            filteredCurrencies = currencies
        } else {

            filteredCurrencies = currencies.filter { $0.code.contains(searchText) }
        }
        tvDescripcion.reloadData()
    }
    @IBAction func btnVolver(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
       
        let pantalla = storyBoard.instantiateViewController(withIdentifier: "principal") as! PrincipalViewController
        
        self.present(pantalla, animated: true, completion: nil)
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currency = filteredCurrencies[indexPath.row]
        let code = currency.code
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let exchangeRateViewController = storyboard.instantiateViewController(withIdentifier: "Conversion") as! ConversionViewController
        
        
        exchangeRateViewController.base = code
        

        present(exchangeRateViewController, animated: true, completion: nil)
    }
    

}
