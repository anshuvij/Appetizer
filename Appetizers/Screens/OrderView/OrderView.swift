//
//  OrderView.swift
//  Appetizers
//
//  Created by Anshu Vij on 12/09/23.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order : Order
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                VStack {
                    
                    List {
                        ForEach(order.items) { appetizer in
                            
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete { indexSet in
                            order.deleteItemsAtOffsets(at: indexSet)
                        }
                    }.listStyle(PlainListStyle())
                    
                    Button {
                        
                    }label: {
                        //ApButton(title: "$\(order.totalPrice,specifier: "%.2f") - Place Order")
                        Text("$\(order.totalPrice,specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    //.standardButtonStyle()
                    .padding(.bottom,25)
                        
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", msg: "You have no items in your order. Please add an appetizers!")
                }
                
                
            } .navigationTitle("🧾 Orders")
            
            
           
            
        }
       
    }
    
   
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
