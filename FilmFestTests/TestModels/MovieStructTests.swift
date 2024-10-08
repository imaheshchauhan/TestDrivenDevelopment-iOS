//
//  MovieStructTests.swift
//  FilmFestTests
//
//  Created by Mahesh Chauhan on 27/09/2024.
//

import XCTest

@testable import FilmFest
final class MovieStructTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Intitalization
    func testInit_MovieWithTitle() {
        let testMovie = Movie(title: "Generic Blockbuster")
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
    }

    func testInit_SetMovieTitleAndReleaseDate() {
        let testMovie = Movie(title: "Romantic Comedy", releaseDate: "1998")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1998")
    }
    
    // MARK: Equatable
    func testEquatable_ReturnsTrue() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action")
        
        XCTAssertEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentTitle() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Adventure")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentReleaseDate() {
        let actionMovie1 = Movie(title: "Action", releaseDate: "1998")
        let actionMovie2 = Movie(title: "Action", releaseDate: "20")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
}
