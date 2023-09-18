//
//  CustomModifires.swift
//  Appetizers
//
//  Created by Anshu Vij on 13/09/23.
//

import SwiftUI

struct StandardButtonStyle : ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
        .buttonStyle(.bordered)
        .tint(.brandPrimary)
        .controlSize(.large)
        
        
    }
}

extension View {
    
    func standardButtonStyle() -> some View {
        
        self.modifier(StandardButtonStyle())
    }
}
