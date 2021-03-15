//
//  RelatedMovies.swift
//  movies2you
//
//  Created by Vitor Gomes on 15/03/21.
//

import Foundation

struct RelatedMovies: Codable {
    
    var page: Int?
    var results: [SimilarMovie]?
    var total_pages: Int?
    var total_results: Int?
}
