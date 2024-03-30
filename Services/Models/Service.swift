//
//  Service.swift
//  Services
//
//  Created by n.nuraly on 30.03.2024.
//

import Foundation

final class Service: Decodable {
    
    let name: String
    let description: String
    let link: String
    let icon_url: String
    var iconData: Data?
}
