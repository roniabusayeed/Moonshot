//
//  Mission.swift
//  Moonshot
//
//  Created by Abu Sayeed Roni on 2023-08-28.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
    
    var image: String {
        "apollo\(id)"
    }
    
    var displayName: String {
        "Apollo \(id)"
    }
}
