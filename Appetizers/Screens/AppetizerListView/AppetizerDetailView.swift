//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Anshu Vij on 13/09/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer : Appetizers
    @Binding var isShowingDetail : Bool
    @EnvironmentObject var order : Order
    
    var body: some View {
        
        VStack {
            
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .scaledToFit()
                .frame(width: 300, height: 225)
            
            VStack {
                
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                    
                }
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShowingDetail = false
            } label: {
               // ApButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                
            }
            .modifier(StandardButtonStyle())
            .padding(.bottom,30)
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            
            XDismissBUtton()
        } , alignment: .topTrailing)
        
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
        
    }
}

struct NutritionInfo : View {
    
    let title : String
    let value : Int
    
    var body: some View {
        
        VStack(spacing: 5) {
            
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            Text("\(value)")
                .foregroundColor(.gray)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
