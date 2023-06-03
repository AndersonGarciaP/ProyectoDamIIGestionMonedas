//
//  MonedaTableViewCell.swift
//  ProyectoGestionDeMonedas
//
//  Created by Alexander Claude Garcia Palacios on 2/06/23.
//  Copyright © 2023 cibertec. All rights reserved.
//

import UIKit

class MonedaTableViewCell: UITableViewCell {

    @IBOutlet weak var tbMoneda: UILabel!
    @IBOutlet weak var tbPais: UILabel!
    @IBOutlet weak var tbCotizacion: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
