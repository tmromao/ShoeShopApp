//
//  CartView.swift
//  ShoeShopApp
//
//  Created by Tiago Miguel de Jesus Romao on 05/05/2022.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack{
        if cartManager.count > 0 {
            ForEach(cartManager.items){ item in
                Text(item.product.name)
                
            }
            Divider()
            HStack {
                Text("Your cart total is")
                Spacer()
                Text("$\(cartManager.total).00")
                    .bold()
            }
            .padding()
            
            //TODO : Replace this with payment button
            Button(action:{}){
                Text("Pay with Apple Pay")
            }
        }
        else {
            VStack{
                Image(systemName: "cart")
                    .font(.largeTitle)
                    .padding()
                    .overlay(Circle().stroke(lineWidth: 2))
                
                Text("Cart is empty")
            }
            .foregroundColor(.gray)
        }
            Spacer()
        }
        .navigationTitle("Shopping card")
        .padding(.top)
        .onDisappear{
            //TODO : When payment is success, set state payment manager and card manager
        }
        }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        //CartView()
            //.environmentObject(CartManager())
        ContentView()
    }
}
