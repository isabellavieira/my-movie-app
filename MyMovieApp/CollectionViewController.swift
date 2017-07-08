//
//  ViewController.swift
//  MyMovieApp
//
//  Created by Isabella Vieira on 18/10/16.
//  Copyright © 2016 Isabella Vieira. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    var reuseIdentifier:String = "cell"
    static var cellSelected:Int!
    static var movieList:[Movie] = DAO.tmdbMovieList
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CollectionViewController.movieList.count
    }
    
    
    // Configure the cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        let movie = CollectionViewController.movieList[(indexPath as NSIndexPath).item]
        let data = try? Data(contentsOf: URL(string: movie.posterPath)!)
        cell.posterImage.image = UIImage(data: data!)
        cell.lbTitle.text = movie.title
        cell.item = (indexPath as NSIndexPath).item
        
        return cell
    }
    
    // Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let cell = sender as! CollectionViewCell
            CollectionViewController.cellSelected = cell.item
        }
    }
    
}

