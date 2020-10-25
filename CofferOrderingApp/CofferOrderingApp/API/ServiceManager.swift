//
//  ServiceManager.swift
//  CofferOrderingApp
//
//  Created by Hiram Castro on 10/18/20.
//

import Foundation


enum DataError:Error {
    case invalidResponse
    case invalidData
    case decodingError
    case serverError
}

class ServiceManager {
    
    static let shared = {
        return ServiceManager()
    }
    
    private init() {}
    
    typealias resultList<T> = (Result<[T], Error>) -> Void
    typealias resultData<T> = (Result<T, Error>) -> Void
    
    func downloadDataList<T: Decodable>(of type: T.Type, from url:URL, completion: @escaping resultList<T>) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(DataError.invalidResponse))
                return
            }
            
            if 200 ... 299 ~= response.statusCode {
                if let data = data {
                    do {
                        let decodedData: [T] = try JSONDecoder().decode([T].self, from: data)
                        completion(.success(decodedData))
                    } catch {
                        completion(.failure(DataError.decodingError))
                    }
                } else {
                    completion(.failure(DataError.invalidData))
                }
            } else {
                completion(.failure(DataError.serverError))
            }
            
        }.resume()
    }
    
    func downloadData<T: Decodable>(of type: T.Type, from url:URL, completion: @escaping resultData<T>) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(DataError.invalidResponse))
                return
            }
            
            if 200 ... 299 ~= response.statusCode {
                if let data = data {
                    do {
                        let decodedData: T = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedData))
                    } catch {
                        completion(.failure(DataError.decodingError))
                    }
                } else {
                    completion(.failure(DataError.invalidData))
                }
            } else {
                completion(.failure(DataError.serverError))
            }
            
        }.resume()
    }
    
}
