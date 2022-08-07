//
//  Reponse.swift
//  F1 Pliotları
//
//  Created by halil ibrahim Elkan on 6.08.2022.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    
    let items: T?
}

struct Driver: Decodable {
    let id: Int?
    let name: String?
    let point: Int?
    let age: Int?
    let image: String?
    let team: String?
}

struct CustomError: Error {
    let message: String
}
