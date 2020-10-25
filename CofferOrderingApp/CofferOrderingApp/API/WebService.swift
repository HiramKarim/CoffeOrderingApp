//
//  WebService.swift
//  CofferOrderingApp
//
//  Created by Hiram Castro on 10/24/20.
//

import Foundation

struct Resource<T: Codable> {
    let url:URL
}

class WebService {
    
    static let shared = {
        return WebService()
    }
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T,DataError>) -> Void) {
        
        URLSession.shared.dataTask(with: resource.url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return
            }
            
            let result = try? JSONDecoder().decode(T.self, from: data)
            if let result = result {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                completion(.failure(.decodingError))
            }
            
        }.resume()
        
    }
    
}
