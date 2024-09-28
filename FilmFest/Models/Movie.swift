//
//  Movie.swift
//  FilmFest
//
//  Created by Mahesh Chauhan on 27/09/2024.
//

import Foundation

struct Movie: Equatable {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}

func == (lhs: Movie, rhs: Movie) -> Bool {
    lhs.title == rhs.title && lhs.releaseDate == rhs.releaseDate
}
