//
//  MoviesViewModel.swift
//  Anupam-Seekho
//
//  Created by Anu on 30/10/24.
//

import Foundation
import SwiftUI

class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []


    func fetchMovies() {
        MovieService.shared.fetchPopularMovies { fetchedMovies in
            if let fetchedMovies = fetchedMovies {
                DispatchQueue.main.async {  
                    self.movies = fetchedMovies
                }
            } else {
                print("Failed to load movies.")
            }
        }
    }
}
