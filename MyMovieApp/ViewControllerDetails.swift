//
//  ViewControllerDetails.swift
//  MyMovieApp
//
//  Created by Isabella Vieira on 10/18/16.
//  Copyright © 2016 Isabella Vieira. All rights reserved.
//

import UIKit

class ViewControllerDetails: UIViewController {
    

    @IBOutlet weak var posterImage:UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lboverview: UILabel!
    @IBOutlet weak var lbAverage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let movie = CollectionViewController
            .movieList[CollectionViewController
                .cellSelected]
        
        lboverview.text = movie.overview
        lbAverage.text = lbAverage.text! +
            String(movie.voteAverage) + "/ 10"
        lbTitle.text = movie.title
        let data = try? Data(contentsOf:
            URL(string: movie.posterPath)!)
        self.posterImage.image = UIImage(data: data!)
    }
    
}
