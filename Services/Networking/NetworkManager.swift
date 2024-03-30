//
//  NetworkManager.swift
//  Services
//
//  Created by n.nuraly on 30.03.2024.
//

import Foundation

private enum Constants {
    
    static let apiPath = "https://publicstorage.hb.bizmrg.com/sirius/result.json"
}

protocol INetworkManager: AnyObject {
    
    func fetchServices(completion: @escaping (Result<Apps, Error>) -> Void)
}

final class NetworkManager {}

// MARK: - INetworkManager

extension NetworkManager: INetworkManager {
    
    func fetchServices(completion: @escaping (Result<Apps, Error>) -> Void) {
        guard let url = URL(string: Constants.apiPath) else {
            completion(.failure(NetworkError.invalidApi))
            return
        }
        
        URLSession.shared.fetchData(at: url) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
