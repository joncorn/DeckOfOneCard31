//
//  CardError.swift
//  DeckOfOneCard31
//
//  Created by Jon Corn on 1/21/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import Foundation

enum CardError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Internal error. Please update Deck of One Card or contact support."
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "The server responded with no data."
        case .unableToDecode:
            return "The server responded with bad data."
        }
    }
}
