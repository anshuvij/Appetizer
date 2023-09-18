//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Anshu Vij on 13/09/23.
//

import SwiftUI

final class AccountViewModel : ObservableObject {
    
    @Published var user = User()
    @Published var alertValue : AlertItem?
    @AppStorage("user") private var userData : Data?
    
    var isValidForm : Bool {
        
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
           
            alertValue = AlertContext.inCompleteData
            return false
        }
        
        guard user.email.isValidEmail else {
            
            alertValue = AlertContext.invalidEmail
            return false
        }
        
        return true
        
    }
    
    func saveChanges() {
        
        guard isValidForm else {
            return
        }
        
        do {
            
            let data = try JSONEncoder().encode(user)
            userData = data
            alertValue = AlertContext.userSaveSuccess
        }
        catch {
            alertValue = AlertContext.inValidUserData
        }
    }
    
    
    func retrieveUser() {
        
        guard let userData else {
            
            return
        }
        
        do {
            
            user = try JSONDecoder().decode(User.self, from: userData)
           
        }
        catch {
            alertValue = AlertContext.inValidUserData
        }
        
    }
    
}
