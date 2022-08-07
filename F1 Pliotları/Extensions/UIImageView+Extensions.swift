//
//  UIImageView+Extensions.swift
//  F1 Pliotları
//
//  Created by halil ibrahim Elkan on 7.08.2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(with imageUrl: String?) {
        
        guard let imageUrl = imageUrl,
              let url = URL(string: imageUrl) else {return}
        
        self.kf.setImage(with: url)
    }
}
