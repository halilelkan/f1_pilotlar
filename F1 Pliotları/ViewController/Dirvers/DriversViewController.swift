//
//  DriversViewController.swift
//  F1 Pliotları
//
//  Created by halil ibrahim Elkan on 7.08.2022.
//

import UIKit
import Alamofire

class DriversViewController: BaseViewController {
    
    
    @IBOutlet private weak var driversTabelView: UITableView!
    private let network = Network()

    private var drivers: [Driver] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("data  \(drivers)")
        let nib = UINib(nibName: "DriverTableViewCell", bundle: nil)
        driversTabelView.register(nib, forCellReuseIdentifier: "DriverTableViewCell")
        
        driversTabelView.dataSource = self
        driversTabelView.delegate = self
        
        fetchDrivers()
    }

    func fetchDrivers(){
        
        network.request(EndPointType: .drivers) { (items: Result<BaseResponse<[Driver]>, CustomError>) in
            switch items {
            case .success(let response):
                self.drivers = response.items ?? []
                DispatchQueue.main.async {
                    self.driversTabelView.reloadData()
                }
                
            case .failure(let error):
                print(error.message)
            }
        }
    }
}

extension DriversViewController: UITableViewDataSource, UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drivers.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DriverTableViewCell") as! DriverTableViewCell
        
        let driver = drivers[indexPath.row]
        
        cell.configure(with: driver)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let id = drivers[indexPath.row].id else{return}
        let driverDetails = DriverDetailViewController(driverId: id)
        
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(driverDetails, animated: true)
        }
        
    }
}
