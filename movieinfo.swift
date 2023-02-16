//
//  movieinfo.swift
//  flixster part1
//
//  Created by Alex Rivas on 2/7/23.
//

import Foundation
struct movies:Decodable{
    let title:String
    let overview:String
    let  poster_path:String
    let  popularity:Float
    let vote_average:Float
    let vote_count: Int
    
    
}
struct moviefromdb:Decodable{
    let results:[movies]
    
}
/*extension movies {
    static var movielist:[movies] = [
        movies(moviename: "Puss in Boots: The Last Wish",
               moviedescription:"Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.",
               movieart: URL(string:"https://image.tmdb.org/t/p/w154/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")!,
               moviepop:"3910.547",
               voteavg: "8.6",
               votecount:"3374"),
        
        movies(moviename:"Devotion",
               moviedescription:"The harrowing true story of two elite US Navy fighter pilots during the Korean War. Their heroic sacrifices would ultimately make them the Navy's most celebrated wingmen. ",
               movieart:URL(string:"https://image.tmdb.org/t/p/w154/26yQPXymbWeCLKwcmyL8dRjAzth.jpg")!,
               moviepop:"1490.109",
               voteavg:"7.7",
               votecount:"244"),
        
        movies(moviename: "The Price We Pay",
               moviedescription:"After a pawn shop robbery goes askew, two criminals take refuge at a remote farmhouse to try to let the heat die down, but find something much more menacing",
               movieart: URL(string:"https://image.tmdb.org/t/p/w154/8fwJt0qZieQ7dKaiiqehObWpXYT.jpg")!,
               moviepop:"1481.06",
               voteavg:"6.3",
               votecount:"27"),
        
        movies(moviename:"Kids vs. Aliens",
               moviedescription: "All Gary wants is to make awesome home movies with his best buds. All his older sister Samantha wants is to hang with the cool kids. When their parents head out of town one Halloween weekend, an all-time rager of a teen house party turns to terror when aliens attack, forcing the siblings to band together to survive the night.",
               movieart:URL(string:"https://image.tmdb.org/t/p/w154/wQ53sO5n9LCFbssV3oQ4CuajL1L.jpg")!,
               moviepop:"1471.056",
               voteavg:"7.3",
               votecount:"3"),
        
        movies(moviename: "Glass Onion: A Knives Out Mystery",
               moviedescription: "World-famous detective Benoit Blanc heads to Greece to peel back the layers of a mystery surrounding a tech billionaire and his eclectic crew of friends. ",
               movieart: URL(string:"https://image.tmdb.org/t/p/w154/vDGr1YdrlfbU9wxTOdpf3zChmv9.jpg")!,
               moviepop:"1088.937",
               voteavg:"7.1",
               votecount:"3275")
    ]
}*/
