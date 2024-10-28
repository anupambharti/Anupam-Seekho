//
//  MovieDetailViewModel.swift
//  Anupam-Seekho
//
//  Created by Anu on 30/10/24.
//

import Foundation
import SwiftUI

class MovieDetailViewModel: ObservableObject {
    @Published var movieDetail: MovieDetail?
    @Published var trailerURL: URL?

   
    func fetchMovieDetail(movieID: Int) {
        MovieService.shared.fetchMovieDetail(movieID: movieID) { detail in
            if let detail = detail {
                DispatchQueue.main.async {
                    self.movieDetail = detail
                }
            } else {
                print("Failed to load movie details.")
            }
        }
    }

    
    func fetchMovieTrailer(movieID: Int) {
        MovieService.shared.fetchMovieTrailers(movieID: movieID) { trailers in
            if let trailers = trailers,
               let firstTrailer = trailers.first(where: { $0.site == "YouTube" && ($0.type == "Trailer" || $0.type == "Teaser") }) {
                let youtubeURLString = "https://www.youtube.com/watch?v=\(firstTrailer.key)"
                DispatchQueue.main.async {
                    self.trailerURL = URL(string: youtubeURLString)
                    print("Trailer URL: \(youtubeURLString)")
                }
            } else {
                print("No YouTube trailers found.")
            }
        }
    }
}
