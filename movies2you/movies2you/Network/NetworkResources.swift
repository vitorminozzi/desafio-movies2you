//
//  NetworkResources.swift
//  movies2you
//
//  Created by Vitor Gomes on 15/03/21.
//

import Foundation

struct NetworkResources {
    
    // for get movie by id
    static let url: String = "https://api.themoviedb.org/3/movie/"
    static let apiKey: String = "e79d45ca7533f2778162f36ecf5ed5a7"
    static let prepareKey: String = "?api_key="
    
    //for get similar movies
    
    static let preparePage: String = "&language=en-US&page=1"
    static let caseSimilar: String = "/similar"
}
