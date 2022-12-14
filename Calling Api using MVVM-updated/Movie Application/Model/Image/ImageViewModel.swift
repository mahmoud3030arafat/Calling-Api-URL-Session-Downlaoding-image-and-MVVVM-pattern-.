

import UIKit

class ImageViewModel:NSObject {
    //MAHMOUD:-variables
    
    var imageService:ImageService!
    var bindingImageFromModelViewToView: (()->()) = {}

    var imageData:UIImage!{
        didSet{
            
            // binding data
            self.bindingImageFromModelViewToView()
            
        }
    }
    
    
    
    init( url:String!) {
        super.init()
        imageService = ImageService()
        fetchImageData(url: url)
    }
    
    
    
    
    func fetchImageData(url:String){
        
        imageService.getImageDataFrom(url:url) { (image) in
            self.imageData = image
        }
        
    }

    
}
