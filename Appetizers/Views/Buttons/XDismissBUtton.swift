//
//  XDismissBUtton.swift
//  Appetizers
//
//  Created by Anshu Vij on 13/09/23.
//

import SwiftUI

struct XDismissBUtton: View {
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30,height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
                
                
        }
    }
}

struct XDismissBUtton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissBUtton()
    }
}
