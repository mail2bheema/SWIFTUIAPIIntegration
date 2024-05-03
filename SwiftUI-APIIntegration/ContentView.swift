//
//  ContentView.swift
//  SwiftUI-APIIntegration
//
//  Created by Admin on 21/04/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = ProductViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else {
                    List(viewModel.products) { product in
                        VStack(alignment: .leading) {
                            Text(product.title)
                                .font(.headline)
                            Text(product.description)
                                .foregroundColor(.secondary)
                            Text(String(format: "$%.2f", product.price))
                                .foregroundColor(.blue)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Products")
            .onAppear {
                viewModel.fetchProducts()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
