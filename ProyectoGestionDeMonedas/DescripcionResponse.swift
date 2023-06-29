//
//  DescripcionResponse.swift
//  ProyectoGestionDeMonedas
//
//  Created by Alexander Claude Garcia Palacios on 29/06/23.
//  Copyright © 2023 cibertec. All rights reserved.
//


import Foundation

struct Currency: Codable {
    let description: String
    let code: String
}

struct CurrencyList: Codable {
    let symbols: [String: Currency]
}


