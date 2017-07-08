//
//  CollectionViewCell.swift
//  MyMovieApp
//
//  Created by Isabella Vieira on 10/18/16.
//  Copyright © 2016 Isabella Vieira. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    var item:Int!
    
    override func awakeFromNib () {
        super.awakeFromNib()
        posterImage.adjustsImageWhenAncestorFocused = true
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if context.nextFocusedView == self {
            coordinator.addCoordinatedAnimations({ () -> Void in
                //self.tintColor = .white
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowOpacity = 0.2
                self.layer.shadowRadius = 5
                self.layer.shadowOffset = CGSize(width: 0, height: 3)
                }, completion: nil)
        } else if context.previouslyFocusedView == self {
            coordinator.addCoordinatedAnimations({ () -> Void in
                self.layer.shadowOffset = CGSize.zero
                self.layer.shadowColor = UIColor.clear.cgColor
                }, completion: nil)
        }
    }
}
