//
//  DriverTableViewCell.swift
//  F1 Pliotları
//
//  Created by halil ibrahim Elkan on 7.08.2022.
//

import UIKit

class DriverTableViewCell: UITableViewCell {

    @IBOutlet private weak var driverNameLabel: UILabel!
    @IBOutlet private weak var driverPointLabel: UILabel!
    
    func configure(with driver: Driver){
        self.driverNameLabel.text = driver.name
        self.driverPointLabel.text = driver.point?.toString
    }
    
}
