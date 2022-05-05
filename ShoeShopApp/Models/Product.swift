//
//  Product.swift
//  ShoeShopApp
//
//  Created by Tiago Miguel de Jesus Romao on 04/05/2022.
//

import Foundation

struct Product:Identifiable{
    var id = UUID()
    var name: String
    var image :String
    var price:Int
    var description:String
    
}

extension Product {
    static var productList = [
        Product(name: "Nike Air 1", image: "shoe-1", price: 19, description: "Nike air 1 is iconic"),
        Product(name: "Nike Air 2", image: "shoe-2", price: 29, description: "Nike air 2 is iconic"),
        Product(name: "Nike Air 3", image: "shoe-3", price: 39, description: "Nike air 3 is iconic"),
        Product(name: "Nike Air 4", image: "shoe-4", price: 49, description: "Nike air 4 is iconic"),
        Product(name: "Nike Air 5", image: "shoe-5", price: 59, description: "Nike air 5 is iconic"),
        Product(name: "Nike Air 6", image: "shoe-6", price: 69, description: "Nike air 6 is iconic")
    ]
}
