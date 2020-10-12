//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by Jered Leisey on 10/9/20.
//

import XCTest
@testable import FilmFest

class MovieManagerTests: XCTestCase {
	
	var sut: MovieManager!	// sut stands for 'system under test'
	
	let scifiMovie = Movie(title: "Sci-Fi")
	let arthouseMovie = Movie(title: "Arthouse Drama")
	let actionMovie = Movie(title: "Action/Adventure")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
		sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	// MARK: Initial Values
	
	func testInit_MoviesToSee_ReturnsZero() {
		XCTAssertEqual(sut.moviesToSeeCount, 0)
	}
	
	func testInit_MoviesSeen_ReturnsZero() {
		XCTAssertEqual(sut.moviesSeenCount, 0)
	}
	
	// MARK: Add & Query
	
	func testAdd_moviesToSee_ReturnsOne() {
		sut.addMovie(movie: scifiMovie)
		
		XCTAssertEqual(sut.moviesToSeeCount, 1)
	}
	
	func testQuery_ReturnsMovieAtIndex() {
		sut.addMovie(movie: arthouseMovie)
		
		let moviewQueried = sut.movieAtIndex(index: 0)
		XCTAssertEqual(arthouseMovie.title, moviewQueried.title)
	}
	
	// MARK: Checking Off
	
	func testCheckOffMovie_UpdatesMovieManagerCounts() {
		sut.addMovie(movie: actionMovie)
		sut.checkOffMovieAtIndex(index: 0)
		
		XCTAssertEqual(sut.moviesToSeeCount, 0)
		XCTAssertEqual(sut.moviesSeenCount, 1)
	}
	
	func testCheckOffMovie_RemovesMovieFromArray() {
		sut.addMovie(movie: scifiMovie)
		sut.addMovie(movie: arthouseMovie)
		sut.checkOffMovieAtIndex(index: 0)
		
		XCTAssertEqual(sut.movieAtIndex(index: 0).title, arthouseMovie.title)
	}
	
	func testCheckOffMovie_ReturnsMovieAtIndex() {
		sut.addMovie(movie: scifiMovie)
		sut.checkOffMovieAtIndex(index: 0)
		
		let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
		XCTAssertEqual(scifiMovie.title, movieQueried.title)
		}
	
	// MARK: Clearing & Resetting
	
	func testClearArrays_ReturnsArrayCountsOfZero() {
		sut.addMovie(movie: scifiMovie)
		sut.addMovie(movie: actionMovie)
		sut.checkOffMovieAtIndex(index: 0)
		
		XCTAssertEqual(sut.moviesToSeeCount, 1)
		XCTAssertEqual(sut.moviesSeenCount, 1)
		
		sut.clearArrays()
		
		XCTAssertEqual(sut.moviesToSeeCount, 0)
		XCTAssertEqual(sut.moviesSeenCount, 0)
	}
	
	// MARK: Duplicates

	func testDuplicateMovies_ShouldNotBeAddedToArray() {
		sut.addMovie(movie: scifiMovie)
		sut.addMovie(movie: scifiMovie)
		
		XCTAssertEqual(sut.moviesToSeeCount, 1)
	}
}
