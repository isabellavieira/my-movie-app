//
//  Movie.swift
//  MyMovieApp
//
//  Created by Isabella Vieira on 18/10/16.
//  Copyright © 2016 Isabella Vieira. All rights reserved.
//

import Foundation


class Movie {
    
    var title : String!
    var overview : String!
    var posterPath : String!
    var voteAverage : Double!
    var originalTitle : String!
    
    init(title         : String,
         overview      : String,
         posterPath    : String,
         voteAverage   : Double,
         originalTitle : String) {
        
        
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
        self.voteAverage = voteAverage
        self.originalTitle = originalTitle
    }
}
