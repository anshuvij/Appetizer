//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Anshu Vij on 12/09/23.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
