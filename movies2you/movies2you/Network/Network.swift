//
//  Network.swift
//  movies2you
//
//  Created by Vitor Gomes on 15/03/21.
//

import Foundation

typealias completion<T> = (_ result: T,_ failure: String?) -> Void

class Network {
    
    let session: URLSession = URLSession.shared
    // GET MOVIE BY ID
    
    func getData(movieID: String, completion: @escaping completion<Movies?>){
        
        let url: URL? = URL(string: NetworkResources.url + movieID + NetworkResources.prepareKey + NetworkResources.apiKey)
        
        if let url = url {
            let task: URLSessionTask = session.dataTask(with: url) { (data, response, error) in
                
                do {
                    let movie = try JSONDecoder().decode(Movies.self, from: data ?? Data())
                    completion(movie, nil)
                }catch{
                    print(error.localizedDescription)
                    print(error)
                    completion(nil, "Falha no parse")
                }
            }
            task.resume()
        }
    }
    
    // GET SIMILAR MOVIES
    
    func getSimilarData(movieID: String, completion: @escaping completion<RelatedMovies?>){
        
        let url: URL? = URL(string: NetworkResources.url + movieID + NetworkResources.caseSimilar + NetworkResources.prepareKey + NetworkResources.apiKey + NetworkResources.preparePage)
        
        if let url = url {
            let task: URLSessionTask = session.dataTask(with: url) { (data, response, error) in
                
                do {
                    let relatedMovie = try JSONDecoder().decode(RelatedMovies.self, from: data ?? Data())
                    completion(relatedMovie, nil)
                }catch{
                    print(error.localizedDescription)
                    print(error)
                    completion(nil, "Falha no parse")
                }
            }
            task.resume()
        }
    }
    
}



