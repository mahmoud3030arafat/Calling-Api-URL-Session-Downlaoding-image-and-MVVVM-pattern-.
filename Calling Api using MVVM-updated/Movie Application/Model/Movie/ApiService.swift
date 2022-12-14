import Foundation
import UIKit

    class ApiService {
    
        private var dataTask:URLSessionDataTask?
        func getDataFromServer (completion : @escaping(Result<MovieModel,Error>)->()){
            let urlString = Constants.identifiers.urlString
            guard let  url = URL(string: urlString) else {return}
            dataTask=URLSession.shared.dataTask(with: url, completionHandler: { (data, response , error ) in
                // handel error
                if let error =  error {
                    print(error.localizedDescription)
                    return
                }
                // handel resonse
                guard let response = response as? HTTPURLResponse else {
                    return
                }
    
    
                // handel data
                guard let data = data else {
                    return
                }
                do {
                    let decoder =  JSONDecoder()
                    let jsonData = try decoder.decode(MovieModel.self, from: data)
    
                    DispatchQueue.main.async {
                        completion(.success(jsonData))
                        
                    }
    
                }catch let error {
                    print(error)
    
                }
    
            })
            dataTask?.resume()
    
        }
        
        
        
      
    
    
    
    
}
    
    
 
