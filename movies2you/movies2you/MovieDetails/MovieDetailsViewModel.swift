//
//  MovieDetailsViewModel.swift
//  movies2you
//
//  Created by Vitor Gomes on 15/03/21.
//

import Foundation

protocol ViewModelDelegate {
    
    func didSuccessGetMovie(success: Bool)
}

class MovieDetailsViewModel {
    
    var network = Network()
    var myMovie: Movies?
    var delegate: ViewModelDelegate?
    
    func getMovie(){
        
        network.getData(movieID: "550") { (success, error) in
            
            if error == nil{
                self.myMovie = success
                self.delegate?.didSuccessGetMovie(success: true)
            }else{
                print("\(error ?? "")")
            }
        }
    }
    
    func getMovieTitle() -> String {
        
        return myMovie?.title ?? ""
    }
}

