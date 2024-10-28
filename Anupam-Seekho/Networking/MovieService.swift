//
//  MovieService.swift
//  Anupam-Seekho
//
//  Created by Anu on 29/10/24.
//

import Foundation
import Foundation

class MovieService {
    static let shared = MovieService()
    private let baseURL = "https://api.themoviedb.org/3/movie/popular"
    private let apiKey = "95eecdfd52a4e91082066d4814658aab" // Replace with your API Key

    func fetchPopularMovies(completion: @escaping ([Movie]?) -> Void) {
        guard let url = URL(string: "\(baseURL)?api_key=\(apiKey)") else {
            print("Invalid URL")
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to fetch movies: \(error)")
                completion(nil)
                return
            }

            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedResponse.results)
                }
            } catch {
                print("Failed to decode JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}

struct MovieResponse: Codable {
    let results: [Movie]
}


extension MovieService {
    func fetchMovieDetail(movieID: Int, completion: @escaping (MovieDetail?) -> Void) {
        let detailURLString = "https://api.themoviedb.org/3/movie/\(movieID)?api_key=\(apiKey)"
        guard let url = URL(string: detailURLString) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to fetch movie details: \(error)")
                completion(nil)
                return
            }

            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }

            do {
                let movieDetail = try JSONDecoder().decode(MovieDetail.self, from: data)
                DispatchQueue.main.async {
                    completion(movieDetail)
                }
            } catch {
                print("Failed to decode movie details: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    func fetchMovieTrailers(movieID: Int, completion: @escaping ([Trailer]?) -> Void) {
        let trailersURLString = "https://api.themoviedb.org/3/movie/\(movieID)/videos?api_key=\(apiKey)"
        guard let url = URL(string: trailersURLString) else {
            print("Invalid URL")
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to fetch movie trailers: \(error)")
                completion(nil)
                return
            }

            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }

            do {
                let trailerResponse = try JSONDecoder().decode(TrailerResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(trailerResponse.results)
                }
            } catch {
                print("Failed to decode trailers: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
