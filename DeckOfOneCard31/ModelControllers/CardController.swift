//
//  CardController.swift
//  DeckOfOneCard31
//
//  Created by Jon Corn on 1/21/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import Foundation

class CardController {
    
    // MARK: - String Helpers
    fileprivate static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/?count=1")
    
    // MARK: - Functions
    static func fetchCard(completion: @escaping (Result<Card, CardError>) -> Void) {
        guard let finalURL = baseURL else { return completion(.failure(.invalidURL)) }
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else { return completion(.failure(.noData))}
            
            do {
                let topLevelObject = try JSONDecoder().decode(Card.self, from: data)
                completion(.success(topLevelObject))
            } catch {
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
}
