Seekho

An iOS application developed as part of an assignment to fetch and display popular movies using The Movie Database (TMDb) API. The app displays a list of popular movies and allows users to view detailed information about each movie, including playing trailers.

Features

Movies List Page: Displays a list of popular movies fetched from TMDb API, with details such as title, rating, duration, and poster image.
Movie Detail Page: Provides more detailed information about the selected movie, including plot, genres, cast, duration, and rating.
Trailer Playback: Allows users to view the trailer of the selected movie using an embedded web view for YouTube trailers.
Setup Instructions

Requirements

Xcode 12+ with Swift 5.5+ or higher
iOS 15.0+ for running the app
How to Run the App

Clone the repository:

git clone https://github.com/anupambharti/Anupam-Seekho.git
Open the Anupam_Seekho.xcodeproj file in Xcode.
API Key: A demo temporary API key is already included in the project for testing purposes. No additional setup is required for the API key. Build and run the app on a simulator or physical device using Xcode.
Assumptions

The app is built using SwiftUI and follows the MVVM architecture.
URLSession is used for network requests, and all heavy operations are executed on background threads to ensure a responsive UI.
Trailers are fetched from YouTube and displayed using a WebView as AVPlayer doesn’t natively support YouTube links.
If a trailer is unavailable, a fallback message is displayed to the user.
Project Structure

Anupam-Seekho/ │ ├── MoviesList/ │ ├── Model/ │ ├── View/ │ ├── ViewModel/ │ ├── MoviesDetails/ │ ├── Model/ │ ├── View/ │ ├── ViewModel/ │ ├── Networking/ │ └── MovieService.swift │ ├── Components/ │ └── WebView.swift

Contact

If you have any questions or need further clarification, feel free to reach out to me:

Email: anupambhartiab@gmail.com LinkedIn: https://www.linkedin.com/in/anupambharti1995/
