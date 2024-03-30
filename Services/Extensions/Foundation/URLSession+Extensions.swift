//
//  URLSession+Extensions.swift
//  Services
//
//  Created by n.nuraly on 30.03.2024.
//

import Foundation

extension URLSession {
    
    func fetchData<T: Decodable>(
        at url: URL,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(error))
            } else if let data {
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(object))
                } catch let decoderError {
                    completion(.failure(decoderError))
                }
            }
        }.resume()
    }
}
