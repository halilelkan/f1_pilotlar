//
//  Network.swift
//  F1 Pliotları
//
//  Created by halil ibrahim Elkan on 6.08.2022.
//

import Foundation
import Alamofire

struct Network {
    
    private var baseUrlString = "http://my-json-server.typicode.com/oguzayan/kuka/"
    
    func request<T: Decodable>(EndPointType: EndPointType, completion: @escaping (Result<T, CustomError>)-> Void) {
        
        guard let url = URL(string: baseUrlString + EndPointType.endPoint) else {return}
        
        AF.request(url, method: .get).response{
            response in
            
            guard let data = response.data else { completion(.failure(CustomError(message: "Gelen Response içerisinde data yok")))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                
                let decodedResponse = try decoder.decode(T.self, from: data)
                completion(.success(decodedResponse))
                
            }
            catch let error{
                completion(.failure(CustomError(message: error.localizedDescription)))
            }
            
        }
        
    }
    
}
