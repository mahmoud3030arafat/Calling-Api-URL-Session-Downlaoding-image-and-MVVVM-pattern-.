

//
//  ImageService.swift
//  Movie Application
//
//  Created by Mahmoud on 12/12/22.
//  Copyright © 2022 mahmoud. All rights reserved.
//


import  UIKit
class ImageService {
    
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
