//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Anshu Vij on 12/09/23.
//

import Foundation

@MainActor final class AppetizerListViewModel : ObservableObject {
    
    @Published var appetizers : [Appetizers] = []
    @Published var alertItem : AlertItem?
    @Published var isLoading : Bool = false
    @Published  var isShowingDetail = false
    @Published  var selectedAppetizer : Appetizers?
    
//    func getAppetizers() {
//        isLoading = true
//        NetworkManager.shared.getAppetizers { [self] result in
//
//            DispatchQueue.main.async { [self] in
//                isLoading = false
//
//                switch result {
//                case .success(let appetizers) :
//                    self.appetizers = appetizers
//                case .failure(let error) :
//                    switch error {
//                    case .invalidData :
//                        alertItem = AlertContext.invalidData
//
//                    case .invalidResponse :
//                        alertItem = AlertContext.invalidResponse
//
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToCOmplete
//                    }
//                }
//            }
//
//        }
//    }
    
    func getAppetizers() {
        isLoading = true
      
        Task {
            
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
                
            } catch {
                if let apError = error as? APError {
                    
                    switch apError {
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToCOmplete
                    }
                }
                else {
                    alertItem = AlertContext.invalidResponse
                }
               
                isLoading = false
            }
        }
        
    }
    
}
