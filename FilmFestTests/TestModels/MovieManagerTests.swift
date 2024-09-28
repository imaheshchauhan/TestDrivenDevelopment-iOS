//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by Mahesh Chauhan on 27/09/2024.
//

import XCTest

@testable import FilmFest
final class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!
    
    let scifieMovie = Movie(title: "Sci-Fi")
    let artHouseMovie = Movie(title: "Arthouse Drama")
    let actionMovie = Movie(title: "Action/Adventure")
    
    override func setUp() {
        super.setUp()
        sut = MovieManager()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Intial Values
    func testInit_MoviesToSee_ReturnsZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }

    func testInit_MoviesSeen_ReturnsZero() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: Add & Query
    func testAdd_MoviesToSee_ReturnsOne() {
        sut.addMovie(movie: scifieMovie)
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        sut.addMovie(movie: artHouseMovie)
        
        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(artHouseMovie.title, movieQueried.title)
    }
    
    // MARK: Checking Off
    func testCheckOffMovie_UpdatesMovieManagerCounts() {
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray() {
        sut.addMovie(movie: actionMovie)
        sut.addMovie(movie: artHouseMovie)
        sut.checkOffMovieAtIndex(index: 0)
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, artHouseMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.addMovie(movie: scifieMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(scifieMovie.title, movieQueried.title)
    }
    
    // MARK: Clearing & Resetting
    func testClearArrays_ReturnsArrayCountsOfZero() {
        sut.addMovie(movie: actionMovie)
        sut.addMovie(movie: artHouseMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK:  Duplicates
    func testDuplicateMovies_ShouldNotBeAddedTOarray() {
        sut.addMovie(movie: scifieMovie)
        sut.addMovie(movie: scifieMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
}
