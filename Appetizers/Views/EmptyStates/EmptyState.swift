//
//  EmptyState.swift
//  Appetizers
//
//  Created by Anshu Vij on 13/09/23.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName : String
    let msg : String
    
    
    var body: some View {
        ZStack {
            
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(msg)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }.offset(y : -50.0)
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState(imageName: "empty-order", msg: "Test message, \n making it long for testing")
    }
}
