//
//  ConversionTableViewCell.swift
//  ProyectoGestionDeMonedas
//
//  Created by Alexander Claude Garcia Palacios on 28/06/23.
//  Copyright © 2023 cibertec. All rights reserved.
//

import UIKit

class ConversionTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTasa: UILabel!
    @IBOutlet weak var lblConversion: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
