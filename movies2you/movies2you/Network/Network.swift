//
//  Network.swift
//  movies2you
//
//  Created by Vitor Gomes on 15/03/21.
//

import Foundation

typealias completion<T> = (_ result: T,_ failure: String?) -> Void

class Network {
    
    // GET MOVIE BY ID
    let session: URLSession = URLSession.shared
    
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
    
}



