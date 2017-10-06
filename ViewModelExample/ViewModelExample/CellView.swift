//
//  View.swift
//  ViewModelExample
//
//  Created by Scotty on 03/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import UIKit

class CellView: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var coloredView: UIView!
    
    
    var model: ViewModel? {
        didSet {
            guard let model = model else {
                nameLabel.text = ""
                positionLabel.text = ""
                return
            }
            
            nameLabel.text = model.name
            positionLabel.text = model.position
            coloredView.backgroundColor = model.color
        }
    }
}


