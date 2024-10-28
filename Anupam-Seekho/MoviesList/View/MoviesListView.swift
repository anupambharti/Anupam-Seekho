//
//  MoviesListView.swift
//  Anupam-Seekho
//
//  Created by Anu on 28/10/24.
//

import SwiftUI

import SwiftUI

struct MoviesListView: View {

    @StateObject private var viewModel = MoviesViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.movies) { movie in
                NavigationLink(destination: MovieDetailView(movieID: movie.id)) {
                    HStack {
                        AsyncImage(url: URL(string: movie.fullPosterURL)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 60, height: 90)
                        .cornerRadius(8)

                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.headline)
                                .lineLimit(2)
                            Text("Rating: \(String(format: "%.1f", movie.rating))/10")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("Popular Movies")
        }
        .onAppear {
            viewModel.fetchMovies()
        }
    }
}
