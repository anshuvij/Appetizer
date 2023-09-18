//
//  Alert.swift
//  Appetizers
//
//  Created by Anshu Vij on 12/09/23.
//

import SwiftUI

struct AlertItem : Identifiable {
    
    let id = UUID()
    let title : Text
    let message : Text
    let dismissButton : Alert.Button
}

struct AlertContext {
    
    static let invalidURL       = AlertItem(title: Text("Server Error"),
                                              message: Text("There is an issue connecting to the server. Try Again!."),
                                              dismissButton: .default(Text("OK")))
    
    static let invalidResponse  = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid response from the server. Please Try Again!."),
                                           dismissButton: .default(Text("OK")))
    
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                       message: Text("The data received from the server was invalid. Please contact support"),
                                       dismissButton: .default(Text("OK")))
    
    static let unableToCOmplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete request. Try Again!."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidEmail     = AlertItem(title: Text("Invalid Email"),
                                       message: Text("The email entered is not correct."),
                                       dismissButton: .default(Text("OK")))
    
    static let inCompleteData = AlertItem(title: Text("Incomplete Information"),
                                            message: Text("Please enter all the details."),
                                            dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"),
                                            message: Text("Your Profile information is saved successfully."),
                                            dismissButton: .default(Text("OK")))
    
    static let inValidUserData = AlertItem(title: Text("Profile Error"),
                                            message: Text("There was an error saving or retreving your profile."),
                                            dismissButton: .default(Text("OK")))
}

