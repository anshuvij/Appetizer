//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Anshu Vij on 12/09/23.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer : Appetizers
    
    var body: some View {
        HStack() {
            
//                AppetizerRemoteImage(urlString: appetizer.imageURL)
//                .scaledToFit()
//                .frame(width: 120, height: 90)
//                .cornerRadius(8)
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            }

            
            VStack(alignment: .leading,spacing: 5.0) {
                
                Text(appetizer.name)
                    .font(.system(.title2, weight: .medium))
                    
                    
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                    
                    
            }
            .padding(.leading)
        }
    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: MockData.sampleAppetizer)
    }
}
