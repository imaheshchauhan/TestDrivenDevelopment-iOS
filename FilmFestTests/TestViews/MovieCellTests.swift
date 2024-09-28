//
//  MovieCellTests.swift
//  FilmFestTests
//
//  Created by Mahesh Chauhan on 28/09/2024.
//

import XCTest

@testable import FilmFest
final class MovieCellTests: XCTestCase {
    
    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!

    override func setUp() {
        super.setUp()
        
        let libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
        _ = libraryVC.view
        tableView = libraryVC.libraryTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
        
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCell_Config_ShouldSetLablesToMovieData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: IndexPath(row: 0, section: 0)) as! MovieCell
        cell.configMovieCell(movie: Movie(title: "Indian Comedy", releaseDate: "2018"))
        
        XCTAssertEqual(cell.textLabel?.text, "Indian Comedy")
        XCTAssertEqual(cell.detailTextLabel?.text, "2018")
    }
}
