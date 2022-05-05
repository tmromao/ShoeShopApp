//
//  Cart.swift
//  ShoeShopApp
//
//  Created by Tiago Miguel de Jesus Romao on 04/05/2022.
//

import Foundation

//Modelo dados para o cartão pagamento
struct Cart:Identifiable{
    var id = UUID()
    var product : Product
    var quantity: Int
}
