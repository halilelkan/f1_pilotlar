//
//  DriverDetailViewController.swift
//  F1 Pliotları
//
//  Created by halil ibrahim Elkan on 7.08.2022.
//

import UIKit
import Alamofire


class DriverDetailViewController: BaseViewController {

    @IBOutlet private weak var driverImageView: UIImageView!
    @IBOutlet private weak var driverNameLabel: UILabel!
    @IBOutlet private weak var driverTeamLabel: UILabel!
    
    private let network = Network()
    private let id: Int
    
    init(driverId: Int) {
        self.id = driverId
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchDriver()
    }

    func fetchDriver(){
        network.request(EndPointType: .driverDetail(id: self.id)) {(items: Result<Driver, CustomError>) in
            
            switch items {
            case .success(let response):
                DispatchQueue.main.async {
                    
                    self.driverNameLabel.text = response.team
                    let ageDriver = "Yaş: " + (response.age?.toString ?? "")
                    self.driverTeamLabel.text = ageDriver
                    self.driverImageView.setImage(with: response.image)
                    
                }
                
            case .failure(let error):
                print(error.message)
            }
        }
    }


}
