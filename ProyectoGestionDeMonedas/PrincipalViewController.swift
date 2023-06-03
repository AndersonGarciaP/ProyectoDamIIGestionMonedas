//
//  PrincipalViewController.swift
//  ProyectoGestionDeMonedas
//
//  Created by AntonioMac on 2/06/23.
//  Copyright © 2023 cibertec. All rights reserved.
//

import UIKit

class PrincipalViewController: UIViewController {

    var nombreUsuario: String?
    @IBOutlet weak var lblBienvenida: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let nombreUsuario = nombreUsuario{
            lblBienvenida.text = "Hola, \(nombreUsuario)!"
        }
        
    }
    
    @IBAction func btnSalir(_ sender: UIButton) {
        UsuarioManager.shared.usuarioActual = nil
        if let loginExit = storyboard?.instantiateViewController(withIdentifier: "login"){
            UIApplication.shared.windows.first?.rootViewController = loginExit
        }
    }
    
    @IBAction func btnMonedas(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let pantalla = storyBoard.instantiateViewController(withIdentifier: "listaMoneda") as! MonedaViewController
        self.present(pantalla, animated: true, completion: nil)
    }
    
}
