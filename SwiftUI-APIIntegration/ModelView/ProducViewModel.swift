//
//  ProducViewModel.swift
//  SwiftUI-APIIntegration
//
//  Created by Admin on 21/04/24.
//

import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false
    
    func fetchProducts() {
        isLoading = true
        guard let url = URL(string: "https://dummyjson.com/products") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                guard let data = data, error == nil else {
                    print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(ProductResponse.self, from: data)
                    self.products = response.products
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

