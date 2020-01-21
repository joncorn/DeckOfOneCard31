//
//  CardController.swift
//  DeckOfOneCard31
//
//  Created by Jon Corn on 1/21/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import UIKit

class CardController {
    
    // MARK: - String Helpers
    fileprivate static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/?count=1")
    
    // MARK: - Functions
    static func fetchCard(completion: @escaping (Result<Card, CardError>) -> Void) {
        guard let finalURL = baseURL else { return completion(.failure(.invalidURL))}
        
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
    
    static func fetchImage(for card: Card, completion: @escaping (Result<UIImage, CardError>) -> Void) {
        let url = card.image
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else { return completion(.failure(.noData))}
            guard let image = UIImage(data: data) else { return completion(.failure(.unableToDecode))}
            completion(.success(image))
        }.resume()
    }
}
