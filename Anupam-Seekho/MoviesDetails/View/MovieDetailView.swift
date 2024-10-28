//
//  MovieDetailView.swift
//  Anupam-Seekho
//
//  Created by Anu on 28/10/24.
//

import SwiftUI

import SwiftUI

struct MovieDetailView: View {
    let movieID: Int
    @StateObject private var viewModel = MovieDetailViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let movie = viewModel.movieDetail {
                    Text(movie.title)
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Rating: \(String(format: "%.1f", movie.voteAverage))/10")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("Duration: \(movie.runtime) minutes")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("Overview")
                        .font(.headline)
                    Text(movie.overview)
                        .font(.body)
                    
                    if !movie.genres.isEmpty {
                        Text("Genres")
                            .font(.headline)
                        HStack {
                            ForEach(movie.genres) { genre in
                                Text(genre.name)
                                    .font(.caption)
                                    .padding(5)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(5)
                            }
                        }
                    }
                    
                    if let trailerURL = viewModel.trailerURL {
                        Text("Watch Trailer")
                            .font(.headline)
                        WebView(url: trailerURL)
                            .frame(height: 300)
                            .cornerRadius(10)
                    } else {
                        Text("No trailer available")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                } else {
                    ProgressView("Loading details...")
                }
            }
            .padding()
            .navigationTitle("Movie Details")
        }
        .onAppear {
            viewModel.fetchMovieDetail(movieID: movieID)
            viewModel.fetchMovieTrailer(movieID: movieID)
        }
    }
}
