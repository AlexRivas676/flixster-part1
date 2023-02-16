//
//  postercell.swift
//  flixster part1
//
//  Created by Alex Rivas on 2/15/23.
//

import UIKit
import Nuke

class postercell: UICollectionViewCell {
    
    @IBOutlet weak var posterimageview: UIImageView!
    func config(with movie:movies){
        let imageurl = URL(string:"https://image.tmdb.org/t/p/w500" + movie.poster_path)!
        Nuke.loadImage(with:imageurl, into: posterimageview)
    }
}
