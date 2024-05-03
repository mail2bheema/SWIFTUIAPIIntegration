//
//  Products.swift
//  SwiftUI-APIIntegration
//
//  Created by Admin on 21/04/24.
//

import Foundation
import SwiftUI

struct Product: Identifiable, Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}
struct ProductResponse: Decodable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}
