//
//  EndPointType.swift
//  F1 Pliotları
//
//  Created by halil ibrahim Elkan on 6.08.2022.
//

import Foundation

enum EndPointType {
    
    case drivers
    case driverDetail(id: Int)
    
    var endPoint: String {
        switch self {
        case .drivers:
            return "drivers"
        case .driverDetail(let id):
            return "driverDetail/"+id.toString
        }
    }
    
}
