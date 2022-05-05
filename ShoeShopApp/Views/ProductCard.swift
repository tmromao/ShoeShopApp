//
//  ProductCard.swift
//  ShoeShopApp
//
//  Created by Tiago Miguel de Jesus Romao on 04/05/2022.
//

import SwiftUI

struct ProductCard: View {
    
    
    @EnvironmentObject var cartManager:CartManager
    
    var product : Product
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            
            ZStack(alignment: .bottom) {
                
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width:180)
                    .scaledToFit()
            
            
            VStack(alignment: .leading){
                Text(product.name)
                    .bold()
                
                Text("$\(product.price)")
                    .font(.caption)
            }
            .padding()
            .frame(width: 180, alignment: .leading)
            .background(.ultraThinMaterial, in:RoundedRectangle(cornerRadius: 20))
            }
            .clipped()
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
            Button{
            //adding the product to the cart
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .font(.title3.bold())
                    .padding(10)
                    .background(.thickMaterial)
                    .cornerRadius(50)
                    .clipped()
                    .shadow(radius: 3)
                    .padding(10)
            }
        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        //Producto numero 2, definido na extensão ao produto
        ProductCard(product: Product.productList[1])
        //Notice passing the CartManager
            .environmentObject(CartManager())
    }
}
