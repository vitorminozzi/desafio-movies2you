//
//  MovieDetailsViewModel.swift
//  movies2you
//
//  Created by Vitor Gomes on 15/03/21.
//

import Foundation

protocol ViewModelDelegate {
    
    func didSuccessGetMovie(success: Bool)
    func didSuccessSimilarMovies(success: Bool)
}

class MovieDetailsViewModel {
    
    var network = Network()
    var myMovie: Movies?
    var relatedMovies: RelatedMovies?
    var delegate: ViewModelDelegate?
    
    // prepare details data in controller
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
    
    func getMovieLikes() -> String {
        
        let realNumber = (self.myMovie?.vote_count ?? 0) / 1000
        let thousandAbreviation = "K"
        
        return "\(realNumber)\(thousandAbreviation) Likes"
    }
    
    func getMoviePopularity() -> String {

        return String(myMovie?.popularity ?? 0.0)
    }
    
    // prepare similar movies by movie ID
    
    func getSimilarMovies(){
        
        network.getSimilarData(movieID: "550") { (success, error) in
            
            if error == nil{
                self.relatedMovies = success
                self.delegate?.didSuccessSimilarMovies(success: true)
            }else{
                print(error ?? "")
                print("Falha ao obter filmes relacionados")
            }
        }
    }
    
//    func getMyCellData(index: Int) -> CellData{
//
//        return CellData(title: relatedMovies?.results?[index].title,
//                        year: <#T##String?#>, genre: <#T##[String]?#>, popularity: <#T##String?#>)
//    }
    
}

