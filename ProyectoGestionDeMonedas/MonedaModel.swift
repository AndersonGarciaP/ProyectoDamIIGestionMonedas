//
//  MonedaModel.swift
//  ProyectoGestionDeMonedas
//
//  Created by Alexander Claude Garcia Palacios on 2/06/23.
//  Copyright © 2023 cibertec. All rights reserved.
//

import UIKit

class MonedaModel: NSObject {
    
    var idMoneda: Int16?
    var nomMoneda: String
    var paisMoneda: String
    var simboMoneda: String
    var cotizaMoneda: Double?
    
    
    init(idMoneda: Int16?,nomMoneda: String, paisMoneda: String, simboMoneda: String, cotizaMoneda: Double?){
        self.idMoneda = idMoneda
        self.nomMoneda = nomMoneda
        self.paisMoneda = paisMoneda
        self.simboMoneda = simboMoneda
        self.cotizaMoneda = cotizaMoneda
        
    }
    
    init(nomMoneda: String, paisMoneda: String, simboMoneda: String, cotizaMoneda: Double?){
        self.nomMoneda = nomMoneda
        self.paisMoneda = paisMoneda
        self.simboMoneda = simboMoneda
        self.cotizaMoneda = cotizaMoneda
    }

}
