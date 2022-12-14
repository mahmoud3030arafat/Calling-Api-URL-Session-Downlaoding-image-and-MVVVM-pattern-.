

import UIKit
import MBCircularProgressBar

class MovieListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var movieListTableView: UITableView!
    var allItems = [Resultt]()
    var items = [Resultt]()
    var movieViewModel = MovieViewModel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
       setUp()
        //MAHMOUD:- registering MovieTabelViewCell
        movieListTableView.register(UINib(nibName: Constants.identifiers.MovieTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.identifiers.MovieTableViewCell)
        
        movieViewModel.bindingDataFromModelViewToView={
            self.items=self.movieViewModel.movieData
            self.allItems = self.movieViewModel.movieData
            self.movieListTableView.reloadData()
        }
       
          

        }
     
  
        

    //MAHMOUD:-set up function
        func setUp(){
        movieListTableView.delegate=self
        movieListTableView.dataSource=self

    }
    
    
    //MAHMOUD:-segmented control


    @IBAction func segmented(_ sender: Any) {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0 :
            mylabel.text = segmentedControl.titleForSegment(at: 0)
            case 1 :
            mylabel.text = segmentedControl.titleForSegment(at: 1)


        default:
             mylabel.text = segmentedControl.titleForSegment(at: 2)

        }
        
    }
    
    //MAHMOUD:-filtering data
    
    @IBAction func search(_ sender: UITextField) {
        if sender.text == ""{
            self.items=allItems
            self.movieListTableView.reloadData()
        }else{
        
        
        var filter = items.filter{($0.title?.lowercased().contains(sender.text!))!}
        items = filter
        self.movieListTableView.reloadData()
        }

}


    
}

extension MovieListViewController{
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  items.count
       
        
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
          let cell = movieListTableView.dequeueReusableCell(withIdentifier: Constants.identifiers.MovieTableViewCell, for: indexPath) as! MovieTableViewCell
        
        // movie Image
        let posterPath = items[indexPath.row].posterPath!
         movieViewModel.getImageDataFrom(url: posterPath, completion: { (image) in
            
            cell.movieImage.image = image
         //  self.arrayOgImages.append(image)
          //  self.movieListTableView.reloadData()
           
        })
       
        
        cell.movieName.text = items[indexPath.row].title
        cell.movieDescription.text = items[indexPath.row].overview!
        cell.date.text = items[indexPath.row].releaseDate!
        let newValue  =  items[indexPath.row].voteAverage! * 10
        cell.progressView.value = CGFloat(newValue)
            return cell
            
        }
      
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 304
      }
      
      
      
      
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "DetailsMovieViewController", sender: self)
        print(indexPath.row)

      }
       
    
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     let detailsVC = segue.destination as! DetailsMovieViewController
     let selectedRow = movieListTableView.indexPathForSelectedRow!
        detailsVC.imageUrl = items[selectedRow.row].posterPath!
        detailsVC.titleOfMovie = items[selectedRow.row].title!
        detailsVC.overView = items[selectedRow.row].overview!



     }
    
    
    
    
}




    
        



