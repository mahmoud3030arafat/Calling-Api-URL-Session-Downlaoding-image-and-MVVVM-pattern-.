

import UIKit

class DetailsMovieViewController: UIViewController {
    //MAHMOUD:- IBOutlet
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var viewOfMovie: UIView!
    
    @IBOutlet weak var imageOfMovie: UIImageView!
    @IBOutlet weak var nameOfMovie: UILabel!
    @IBOutlet weak var overViewOfMovie: UILabel!
    
    var imageUrl : String?
    var titleOfMovie:String?
    var overView:String?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageViewModel = ImageViewModel(url: imageUrl!)
        //MAHMOUD:- calling viewChanges function
         viewChanges()
        //MAHMOUD:- download image
        imageViewModel.bindingImageFromModelViewToView={
            self.imageOfMovie.image = imageViewModel.imageData
        }
        
        nameOfMovie.text = titleOfMovie
        overViewOfMovie.text = overView
    }
    
    
    func viewChanges(){
        imageOfMovie.layer.cornerRadius = 24
        viewOfMovie.layer.cornerRadius = 16
        detailsButton.layer.cornerRadius = 12
    }
    
    
    
    @IBAction func detailsButtontapped(_ sender: Any) {

       
        
    }

   

}
