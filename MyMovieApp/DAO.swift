//
//  DAO.swift
//  MyMovieApp
//
//  Created by Isabella Vieira on 10/18/16.
//  Copyright © 2016 Isabella Vieira. All rights reserved.
//

import UIKit

// https://developers.themoviedb.org/3/discover/tv-discover
class DAO {
    
    static var tmdbMovieList = tmdb.movieList
    
    private struct tmdb {
        static let key = "b1f37bdc23a537b59019662a10ba87b2"
        static let posterUrlPrefix = "https://image.tmdb.org/t/p/w500"
        static let dataRequestUrlPrefix = "https://api.themoviedb.org"
        static let apiVersion = "3"
        static let movieListType = "discover"
        static let midiaType = "movie"
        static let sort = "popularity.desc"
        static let language = "pt-BR"
        
        static var dataRequestUrl:String {
            return "\(dataRequestUrlPrefix)/\(apiVersion)/\(movieListType)/\(midiaType)?api_key=\(key)&language=\(language)&sort_by=\(sort)"
        }
        static var movieList:[Movie] {
            let posterUrl = tmdb.posterUrlPrefix
            var movieList:[Movie] = []
            
            let data = try? Data(contentsOf: URL(string: tmdb.dataRequestUrl)!)
            do{
                let contents = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSDictionary
                
                let movies = contents["results"] as! NSArray
                
                for itens in movies {
                    let movie = itens as! NSDictionary
                    
                    let title = movie["title"] as! String
                    let overview = movie["overview"] as! String
                    let posterPath = movie["poster_path"] as! String
                    let voteAverage = movie["vote_average"] as! Double
                    let posterFullPath = posterUrl + posterPath
                    let originalTitle = movie["original_title"] as! String
                    
                    let newMovie = Movie(title: title, overview: overview, posterPath: posterFullPath, voteAverage: voteAverage,
                                         originalTitle: originalTitle)
                    movieList.append(newMovie)
                }
            }
            catch{
                print("Error!!!", data)
            }
            return movieList
        }
        
    }
}
