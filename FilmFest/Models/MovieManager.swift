//
//  MovieManager.swift
//  FilmFest
//
//  Created by Mahesh Chauhan on 27/09/2024.
//

import Foundation

class MovieManager {
    var moviesToSeeCount: Int { return moviesToseeArray.count}
    var moviesSeenCount: Int { return movieSeenArray.count }
    
    private var moviesToseeArray = [Movie]()
    private var movieSeenArray = [Movie]()
    
    func addMovie(movie: Movie) {
        if !moviesToseeArray.contains(movie) {
            moviesToseeArray.append(movie)
        }
    }
    
    func movieAtIndex(index: Int) -> Movie {
        return moviesToseeArray[index]
    }
    
    func checkOffMovieAtIndex(index: Int) {
        guard index < moviesToSeeCount else { return }
        
        let checkedMovie = moviesToseeArray.remove(at: index)
        movieSeenArray.append(checkedMovie)
    }
    
    func checkedOffMovieAtIndex(index: Int) -> Movie {
        return movieSeenArray[index]
    }
    
    func clearArrays() {
        self.moviesToseeArray.removeAll()
        self.movieSeenArray.removeAll()
    }
}
