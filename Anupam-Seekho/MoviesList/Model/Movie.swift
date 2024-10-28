//
//  Movie.swift
//  Anupam-Seekho
//
//  Created by Anu on 29/10/24.
//

import Foundation

import Foundation

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let posterPath: String
    let rating: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case rating = "vote_average"
    }
    
    var fullPosterURL: String {
           return "https://image.tmdb.org/t/p/w500\(posterPath)"
       }
}
