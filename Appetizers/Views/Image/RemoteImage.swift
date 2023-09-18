//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Anshu Vij on 12/09/23.
//

import SwiftUI

final class ImageLoader : ObservableObject {
    
    @Published var image : Image? = nil
    
    func load(fromurlString urlString : String) {
        
        NetworkManager.shared.downloadImage(fromurlString: urlString) { uiImage in
            
            guard let uiImage  else {
                return
            }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
            
        }
    }
}

struct RemoteImage : View {
    
    var image : Image?
    
    var body: some View {
        
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage : View {
    
    @StateObject var imageLoder = ImageLoader()
    let urlString : String
    
    var body: some View {
        
        RemoteImage(image: imageLoder.image)
            .onAppear {
                imageLoder.load(fromurlString: urlString)
            }
    }
}
