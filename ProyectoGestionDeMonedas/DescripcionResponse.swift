//
//  DescripcionResponse.swift
//  ProyectoGestionDeMonedas
//
//  Created by Alexander Claude Garcia Palacios on 29/06/23.
//  Copyright © 2023 cibertec. All rights reserved.
//


import Foundation


struct SimboloList: Codable {
    let symbols: [String: Simbolo]
}

struct Simbolo: Codable {
    let description: String
    let code: String
}



