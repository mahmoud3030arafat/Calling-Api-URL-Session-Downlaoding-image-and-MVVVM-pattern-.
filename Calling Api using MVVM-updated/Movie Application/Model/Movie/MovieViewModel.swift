import Foundation
import UIKit

class MovieViewModel:NSObject {
    //MAHMOUD:-variables
    
    var apiService:ApiService!
    var bindingDataFromModelViewToView: (()->()) = {}

    var movieData:[Resultt]!{
        didSet{
            
            // binding data
            self.bindingDataFromModelViewToView()
            
        }
    }
    
    override init() {
        super.init()
        self.apiService = ApiService()
        self.fetchMovieData()
    }
    
    
    
    
    func fetchMovieData(){
        
        apiService.getDataFromServer {[weak self] (result) in
            switch result{
            case .success(let listOf):
                self!.movieData = listOf.results!
    
            case .failure(let error ) :
                print(error.localizedDescription)
                
                
            }
            
        }
        
    }

    

    

    //MAHMOUD:-calling images

          func getImageDataFrom(url: String,completion : @escaping(UIImage)->()) {
            let  baseurl = URL(string:Constants.identifiers.baseUrl+url)
              URLSession.shared.dataTask(with: baseurl!) { (data, response, error) in
                  // Handle Error
                  if let error = error {
                      print("DataTask error: \(error.localizedDescription)")
                      return
                  }
                  
                  guard let data = data else {
                      // Handle Empty Data
                      print("Empty Data")
                      return
                  }
                  
                  DispatchQueue.main.async {
                      if let image = UIImage(data: data) {
                     //    myImage.image = image
                        completion(image)
                    
                        
          
                      }
                  }
              }.resume()
          }
          
    
}

