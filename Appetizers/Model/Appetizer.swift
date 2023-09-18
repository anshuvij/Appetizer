//
//  Appetizer.swift
//  Appetizers
//
//  Created by Anshu Vij on 12/09/23.
//

import Foundation

struct Appetizers : Decodable, Identifiable {
    
    let id : Int
    let name : String
    let description : String
    let price : Double
    let imageURL : String
    let calories : Int
    let protein : Int
    let carbs : Int
    
}

struct AppetizerResponse : Decodable {
    let request : [Appetizers]
}


struct MockData {
    
    static let sampleAppetizer = Appetizers(id: 001, name: "Test Appetizer 1", description: "This is the description for my appetizer", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)
    static let sampleAppetizer1 = Appetizers(id: 002, name: "Test Appetizer 2", description: "This is the description for my appetizer", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)
    static let sampleAppetizer2 = Appetizers(id: 003, name: "Test Appetizer 3", description: "This is the description for my appetizer", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)
    static let sampleAppetizer3 = Appetizers(id: 004, name: "Test Appetizer 4",  description: "This is the description for my appetizer", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer1, sampleAppetizer2, sampleAppetizer3]
}
