//
//  BaseViewController.swift
//  F1 Pliotları
//
//  Created by halil ibrahim Elkan on 6.08.2022.
//

import UIKit
import SwiftUI

class BaseViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "f1amblem"))
        self.navigationItem.titleView?.contentMode = .scaleAspectFit
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        navigationItem.backBarButtonItem?.tintColor = UIColor(named: "black")
        
        let appearence = UINavigationBarAppearance()
        appearence.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.2274509804, blue: 0.3490196078, alpha: 1)
        
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
        
    }
    

}
