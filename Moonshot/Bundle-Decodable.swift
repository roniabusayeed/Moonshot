//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Abu Sayeed Roni on 2023-08-28.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ filename: String) -> T {
        guard let url = self.url(forResource: filename, withExtension: nil) else {
            fatalError("Failed to locate \(filename) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load the contents of \(filename) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        // Configure the JSON Decoder for handling dates.
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode contents of \(filename) from bundle")
        }
        
        return decoded
    }
}
