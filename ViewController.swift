//
//  ViewController.swift
//  flixster part1
//
//  Created by Alex Rivas on 2/5/23.
//

import UIKit
import Nuke

class ViewController: UIViewController, UITableViewDataSource {
    
    var movie:[movies] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieview.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! movieCell
        let movie = movie[indexPath.row]
        cell.config(with:movie)
        return cell
    }
    @IBOutlet weak var movieview: UITableView!
    override func viewDidLoad() {
        
        movieview.dataSource = self
        let url = URL(string:"https://api.themoviedb.org/3/movie/now_playing?api_key=1ed74b04921324af655d15185bed69bd")!
        let request = URLRequest(url:url)
        let task = URLSession.shared.dataTask(with:request){[weak self] data, response,error in
            if let error = error{
                print(" ❌ Network error:\(error.localizedDescription)")
            }
            guard let data = data else{
                print("❌ Data is nil")
                return
            }
            do{
//                let jsondictionary = try JSONSerialization.jsonObject(with: data) as? [String:Any]
//                print(jsondictionary)
                let decoder = JSONDecoder()
                let response = try decoder.decode(moviefromdb.self, from: data)
                let mov = response.results
                DispatchQueue.main.async {
                    self?.movie = mov
                    self?.movieview.reloadData()
                }//dispatchqueue
                
                print("✅\(mov)")
            }catch{
                print("❌ Error parsing JSON:\(error.localizedDescription)")
                
            }//catch
        }//task
        task.resume()
        super.viewDidLoad()
        //movie = movies.movielist
        
        
        movieview.rowHeight = 208;
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell,
           let indexPath = movieview.indexPath(for:cell),
           let detailviewcontroller = segue.destination as? DetailedViewController{
            let movie = movie[indexPath.row]
            detailviewcontroller.detailedmovie = movie
            
            
        }
       
       
            
    }
    override func viewWillAppear(_ animated:Bool){
        super.viewWillAppear(animated)
        if let indexPath = movieview.indexPathForSelectedRow{
            movieview.deselectRow(at: indexPath, animated: true)
        }
    }

}

