//
//  LoadingView.swift
//  Appetizers
//
//  Created by Anshu Vij on 12/09/23.
//

import SwiftUI

struct ActivityIndicator : UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {

        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .brandPrimary
        activityIndicatorView.startAnimating()
        
        return activityIndicatorView
        
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }

}

struct LoadingView : View {
    
    var body: some View {
        
        ZStack {
            
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ActivityIndicator()
        }
    }
}
