//
//  ConversionViewController.swift
//  ProyectoGestionDeMonedas
//
//  Created by Alexander Claude Garcia Palacios on 28/06/23.
//  Copyright © 2023 cibertec. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var base: String = ""
        var amount: Double = 1
        var rates: [(code: String, rate: Double)] = []

    @IBOutlet weak var lblCode: UILabel!
    @IBOutlet weak var tvConversion: UITableView!
    @IBOutlet weak var txtMonto: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tvConversion.dataSource = self
        tvConversion.delegate = self

        lblCode.text = base
        
        txtMonto.text = "1"


        ConversionMoneda()
    }
    
    func ConversionMoneda() {
        let urlBase = "https://api.exchangerate.host/latest?base=\(base)&amount=\(amount)"
        let urlConsulta = URL(string: urlBase)
        let request = URLRequest(url: urlConsulta!)
        let tarea = URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil {
                if let data = data, let exchangeRate = try? JSONDecoder().decode(ConversionResponse.self, from: data) {
                    
                    let rates = exchangeRate.rates.map { (code: $0.key, rate: $0.value) }
                    
                    let sortedRates = rates.sorted { $0.code < $1.code }

                    DispatchQueue.main.async {
                        
                        self.rates = sortedRates
                        self.tvConversion.reloadData()
                    }
                }
            }
        }
        tarea.resume()
    }



    @IBAction func btnConversion(_ sender: UIButton) {
        
        let amountText = txtMonto.text ?? ""

        if let amount = Double(amountText) {

            self.amount = amount
            ConversionMoneda()
        }
    }


    @IBAction func btnVolver(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
       
        let pantalla = storyBoard.instantiateViewController(withIdentifier: "Descripcion") as! DescripcionViewController
        
        self.present(pantalla, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rates.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "conver") as! ConversionTableViewCell
        let rate = rates[indexPath.row]
        cell.lblConversion.text = rate.code
        cell.lblTasa?.text = String(rate.rate)
        return cell
    }


}

