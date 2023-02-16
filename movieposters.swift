//
//  movieposters.swift
//  flixster part1
//
//  Created by Alex Rivas on 2/14/23.
//

import Foundation
struct movieseachresponse:Decodable{
    let results:[movieposter]
}
struct movieposter:Decodable{
    let movieposter100:URL
    
    
}

