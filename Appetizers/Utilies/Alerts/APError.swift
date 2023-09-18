//
//  APError.swift
//  Appetizers
//
//  Created by Anshu Vij on 12/09/23.
//

import Foundation

enum APError : Error {
    
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

enum APFormError : Error {
    
    case invalidEmail
    case incompleteDetail
}
