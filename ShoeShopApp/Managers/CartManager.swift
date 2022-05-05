//
//  CartManager.swift
//  ShoeShopApp
//
//  Created by Tiago Miguel de Jesus Romao on 05/05/2022.
//

import Foundation

//Monitoring the number of items
//Having a running count
final class CartManager: ObservableObject {
    @Published private(set) var items:[Cart] = []
    @Published private(set) var count = 0
    @Published private(set) var total: Int = 0
    
    func addToCart(product:Product){
        
        //Check if the product exists on the cart
        if let idx = items.firstIndex(where: {item in
            item.product.id == product.id
        }){
            items[idx].quantity += 1
            total += product.price
            count += 1
            return
        }
        
        //Item does not exist at this point
        let cartItem = Cart(product: product, quantity: 1)
        items.append(cartItem)
        total += product.price
        count += 1
        
    }
    
    // use case : remove a product from the cart. May exist once or twice
    func removeFromCart(product:Product){
        if let idx = items.firstIndex(where: { item in
            item.product.id == product.id
        }){
            let amtToRemove = items[idx].quantity * product.price
            let itemsToRemove = items[idx].quantity
            items.remove(at: idx)
            total -= amtToRemove
            count -= itemsToRemove
        }
    }
    
    //Helper function
    func getCartItem(by product:Product)->Cart{
        let foundItems = items.filter { item in
            item.product.id == product.id
        }
        //May cause crashes, but the Cart should never be empty!
        return foundItems[0]
    }
}
