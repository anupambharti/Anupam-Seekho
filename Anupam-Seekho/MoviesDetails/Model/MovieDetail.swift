//
//  MovieDetail.swift
//  Anupam-Seekho
//
//  Created by Anu on 29/10/24.
//

import Foundation

struct MovieDetail: Codable {
    let id: Int
    let title: String
    let overview: String
    let runtime: Int
    let voteAverage: Double
    let genres: [Genre]
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview, runtime, genres
        case voteAverage = "vote_average"
    }
}

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}

struct TrailerResponse: Codable {
    let results: [Trailer]
}

struct Trailer: Codable, Identifiable {
    let id: String
    let key: String
    let site: String
    let type: String
}
