//
//  Movies.swift
//  movies2you
//
//  Created by Vitor Gomes on 15/03/21.
//

import Foundation

struct Movies: Codable {
    
    var adult: Bool?
    var backdrop_path: String?
    var belongs_to_collection: Bool?
    var budget: Int?
    var genres: [Genre]?
    var homepage: String?
    var id: Int?
    var imdb_id: String?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var production_companies: [Companies]?
    var release_date: String?
    var revenue: Int?
    var runtime: Int?
    var spoken_language: [Language]?
    var status: String?
    var tagline: String?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int
}
