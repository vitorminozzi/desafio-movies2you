//
//  MovieDetailsViewController.swift
//  movies2you
//
//  Created by Vitor Gomes on 15/03/21.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var relatedTableView: UITableView!
    @IBOutlet weak var likeSymbolImage: UIImageView!
    @IBOutlet weak var popularityRate: UILabel!
    @IBOutlet weak var popularitySymbol: UIImageView!
    
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
                self.likesLabel.text = self.viewModel.getMovieLikes()
                self.popularityRate.text = self.viewModel.getMoviePopularity()
            }
        }
    }
}
