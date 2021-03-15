//
//  MovieDetailsViewController.swift
//  movies2you
//
//  Created by Vitor Gomes on 15/03/21.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var movieTitle: UILabel!
    var viewModel = MovieDetailsViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.getMovie()
        self.viewModel.delegate = self
    }
}

extension MovieDetailsViewController: ViewModelDelegate{
    func didSuccessGetMovie(success: Bool) {
        
        if success == true{
            DispatchQueue.main.async {
                
                self.movieTitle.text = self.viewModel.getMovieTitle()
            }
        }
    }
}
