//
//  MoviePosterViewController.swift
//  flixster part1
//
//  Created by Alex Rivas on 2/14/23.
//

import UIKit
import Nuke

class MoviePosterViewController: UIViewController, UICollectionViewDataSource {
    var movposter:[movies] = []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movposter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier:"Postercell", for: indexPath) as! postercell
        let poster = movposter[indexPath.item]
        let posterurl = poster.poster_path
         cell.config(with: poster)
        return cell
    }
    

    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        collectionview.dataSource = self
        let layout = collectionview.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        let numcolumns:CGFloat = 3
        
        let url = URL(string:"https://api.themoviedb.org/3/movie/now_playing?api_key=1ed74b04921324af655d15185bed69bd")!
        let request = URLRequest(url:url)
        let task = URLSession.shared.dataTask(with:request){[weak self]data, response,error in
            if let error = error{
                print(" ❌ Network error:\(error.localizedDescription)")
            }
            guard let data = data else{
                print("❌ Data is nil")
                return
            }
            let decoder = JSONDecoder()
            do{
                //let jsondictionary = try JSONSerialization.jsonObject(with: data) as? [String:Any]
                let response = try decoder.decode(moviefromdb.self, from: data)
                let poster = response.results
                DispatchQueue.main.async {
                    self?.movposter = poster
                    self?.collectionview.reloadData()
                    print(poster)
                }
            }catch{
                print("❌ Error parsing JSON:\(error.localizedDescription)")
                
            }
        }
        task.resume()
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue:UIStoryboardSegue, sender:Any?){
        if let cell = sender as? UICollectionViewCell,
           let indexpath = collectionview.indexPath(for:cell),
           let detailviewcontroller = segue.destination as? DetailedViewController{
            let poster = movposter[indexpath.item]
            detailviewcontroller.detailedmovie = poster
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
