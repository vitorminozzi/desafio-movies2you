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
    func getMovie() {
        
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
        
        return String("\(myMovie?.popularity ?? 0.0) Views")
    }
    
    // prepare similar movies by movie ID
    
    func getSimilarMovies() {
        
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
    
    func getMyCellData(index: Int) -> CellData {
        
        return CellData(title: relatedMovies?.results?[index].title,
                        year: self.convertDateToYear(string: relatedMovies?.results?[index].release_date ?? ""),
                        genre: self.convertGenreID(index: index),
                        popularity: String(relatedMovies?.results?[index].popularity ?? 0.0))
    }
    
    func convertGenreID(index: Int) -> String {
        
        if relatedMovies?.results?[index].genre_ids != nil {
            switch relatedMovies?.results?[index].genre_ids?[0] {
            
            case 28:
                return "Action"
            case 12:
                return "Adventure"
            case 16:
                return "Animation"
            case 35:
                return "Comedy"
            case 80:
                return "Crime"
            case 99:
                return "Documentary"
            case 18:
                return "Drama"
            case 10751:
                return "Family"
            case 14:
                return "Fantasy"
            case 36:
                return "History"
            case 27:
                return "Horror"
            case 10402:
                return "Music"
            case 10749:
                return "Romance"
            case 878:
                return "Science Fiction"
            case 53:
                return "Thriller"
            case 10752:
                return "War"
            case 37:
                return "Western"
            default:
                print("Categoria não encontrada")
            }
        }else{
            return "N/A"
        }
        return "n/a"
    }
    
    func convertDateToYear(string: String) -> String { 
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: string)
        let stringFormatter = DateFormatter()
        stringFormatter.dateFormat = "yyyy"
        let year = stringFormatter.string(from: date ?? Date())
        return year
    }
    
}
