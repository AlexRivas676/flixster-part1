//
//  TableViewCell.swift
//  flixster part1
//
//  Created by Alex Rivas on 2/6/23.
//

import UIKit
import Nuke

class movieCell: UITableViewCell {
    
    @IBOutlet weak var movieimage: UIImageView!
    @IBOutlet weak var moviedesc: UILabel!
    @IBOutlet weak var movietitle: UILabel!

    func config(with movie:movies){
        movietitle.text = movie.title
        moviedesc.text = movie.overview
        let imageurl = URL(string:"https://image.tmdb.org/t/p/w500" + movie.poster_path)!
        
        
        Nuke.loadImage(with:imageurl, into: movieimage)
    }
   

    

}
