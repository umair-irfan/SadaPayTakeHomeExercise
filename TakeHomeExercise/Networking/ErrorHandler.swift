//
//  ErrorHandler.swift
//  TakeHomeExercise
//
//  Created by Umair Irfan on 29/06/2021.
//

import Foundation

public struct Errors: Error, Codable {
    let error : String
    let isNetworkError: Bool
    
    static func commonError() -> Errors{
        return Errors(error: "Something went wrong")
    }
    
    init(error: String) {
        self.error = error
        self.isNetworkError = false
    }
    
    init(error: String, isNetworkError: Bool) {
        self.error = error
        self.isNetworkError = isNetworkError
    }
    
}

extension Errors {
    private enum CodingKeys: String, CodingKey {
        case error = "Error"
        case isNetworkError = "Network"
    }
}
