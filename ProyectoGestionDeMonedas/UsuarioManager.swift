//
//  UsuarioManager.swift
//  ProyectoGestionDeMonedas
//
//  Created by AntonioMac on 2/06/23.
//  Copyright © 2023 cibertec. All rights reserved.
//

import Foundation

class UsuarioManager {
    static let shared = UsuarioManager()
    
    var usuarioActual: UsuarioModel?
    
    private init() {}
}
