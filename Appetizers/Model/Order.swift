//
//  Order.swift
//  Appetizers
//
//  Created by Anshu Vij on 13/09/23.
//

import SwiftUI

final class Order : ObservableObject {
    
    @Published var items : [Appetizers] = []
    
    func add(_ appetizer : Appetizers) {
        items.append(appetizer)
    }
    
    func deleteItemsAtOffsets(at offests : IndexSet) {
        items.remove(atOffsets: offests)
    }
    
    var totalPrice : Double {
        
        items.reduce(0) {
            $0 + $1.price
        }
    }
}
