//
//  ProductDetailView.swift
//  ShoeShopApp
//
//  Created by Tiago Miguel de Jesus Romao on 05/05/2022.
//

import SwiftUI

struct ProductDetailView: View {
    
    var product: Product
    
    // Esta variavel para gerir o cartão
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.dismiss) var dismiss
    
    @State private var averageColor: Color = .blue
    
    //Notar a ideia de criar esta "view" no interior da view, para endereçar um botao
    
    private var cartButton: some View {
        NavigationLink {
            CartView()
                .environmentObject(cartManager)
        } label: {
            ZStack(alignment: .topTrailing, content: {
                Image(systemName: "cart")
                    .padding(.top, 5)
                
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
    }
    
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .fill(averageColor)
                VStack{
                    HStack{
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title3)
                                .padding()
                                .background(.thinMaterial)
                                .clipShape(Circle())
                                .foregroundColor(averageColor)
                        }
                        Spacer()
                        //Nota : Aqui como aparece a view do botao
                        cartButton
                            .padding(12)
                            .background(.thinMaterial)
                            .clipShape(Circle())
                            .foregroundColor(averageColor)

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180)
                        .cornerRadius(20)
                        .shadow(radius: 4)
                }
            }
            .edgesIgnoringSafeArea(.top)
            .offset(y: -50)
            .padding(.bottom, -50)
            .frame(height: 300)
            
            HStack {
                Text(product.name)
                    .font(.largeTitle)
                
                Spacer()
                Text("$\(product.price).00")
                    .font(.title3)
                    .foregroundColor(averageColor)
            }
            .padding()
            
            ScrollView{
                Text(product.description)
                    .font(.headline)
            }
            .padding()
            Spacer()
            Button{
                cartManager.addToCart(product: product)
            } label: {
                Text("Add to Cart")
                    .font(.title3.bold())
                    .foregroundColor(.white)
                    .frame( height: 50)
                    .frame(maxWidth: .infinity)
                    .background(averageColor)
                
            }
        }
        //Esconder a Navigation bar porque os botaoes fazem essa funçao
        .navigationBarHidden(true)
        .onAppear{
            averageColor = Color(UIImage(named:product.image)?.averageColor ?? .blue)
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product.productList[0])
            .environmentObject(CartManager())
    }
}
