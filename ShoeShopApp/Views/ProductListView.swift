//
//  ProductListView.swift
//  ShoeShopApp
//
//  Created by Tiago Miguel de Jesus Romao on 05/05/2022.
//

import SwiftUI

struct ProductListView: View {
    
    
    @StateObject var cartManager = CartManager()
    
    //Specifying the type of grid, adaptive, and number of columns, 2
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    private var cartButtonView: some View {
        ZStack(alignment: .topTrailing, content: {
            Image(systemName: "cart")
                .padding(.top, 5)
            
            //UC : If there products on the cart
            if cartManager.count > 0 {
                Text("\(cartManager.count)")
                    .font(.caption2.bold())
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(Color.pink)
                    .cornerRadius(20)
            }
        })
    }
    
    var body: some View {
        
        
        NavigationView {
            //Displaying the product on a grid, 2 columns
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20){
                    ForEach(Product.productList){ product in
                        
                        NavigationLink{
                            ProductDetailView(product: product)
                                .environmentObject(cartManager)

                        } label: {
                            ProductCard(product: product)
                                .environmentObject(cartManager)
                        }
                        .buttonStyle(.plain)
                        
                        
                    }
                }
                .padding()
            }
            .navigationTitle("Sapataria do Romão")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                NavigationLink{
                    CartView()
                        .environmentObject(cartManager)
                }label: {
                    cartButtonView
                }
            })
        }
        //Helping SWIFTUI know the type of layout that should be built, displayed.
        // way to resolve the error relating to constraints building
        .navigationViewStyle(.stack)
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
