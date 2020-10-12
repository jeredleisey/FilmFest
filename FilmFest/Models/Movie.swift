//
//  Movie.swift
//  FilmFest
//
//  Created by Jered Leisey on 10/9/20.
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

func==(lhs: Movie, rhs: Movie) -> Bool {
	if lhs.title != rhs.title {	return false }
	if lhs.releaseDate != rhs.releaseDate { return false }
	
	return true
}
