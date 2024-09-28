//
//  ViewController.swift
//  FilmFest
//
//  Created by Mahesh Chauhan on 27/09/2024.
//

import UIKit

class LibraryViewController: UIViewController {
    
    @IBOutlet var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.libraryTableView.dataSource = self.dataService
        self.libraryTableView.delegate = self.dataService
        
        dataService.movieManager = movieManager
        
        dataService.movieManager?.addMovie(movie: Movie(title: "Action", releaseDate: "1999"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Comedy", releaseDate: "20"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Drama", releaseDate: "202"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Horror", releaseDate: "2020"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Romance", releaseDate: "202"))
        
        libraryTableView.reloadData()
    }

    
}

