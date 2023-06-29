//
//  CoversionResponse.swift
//  ProyectoGestionDeMonedas
//
//  Created by Alexander Claude Garcia Palacios on 29/06/23.
//  Copyright © 2023 cibertec. All rights reserved.
//

import Foundation

struct ConversionResponse: Codable {
    let base: String
    let rates: [String: Double]
}
