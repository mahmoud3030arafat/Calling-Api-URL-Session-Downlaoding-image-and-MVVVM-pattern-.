

import UIKit
import MBCircularProgressBar


class MovieTableViewCell: UITableViewCell {
    //MAHMOUD:-IBOutlet
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var progressView: MBCircularProgressBarView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     
  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //MAHMOUD:- calling changesOnCell function
        changesOnCell()
        // we will get the value of this progress from server
        
    }
    

    //MAHMOUD:-make changing on cell
    func changesOnCell(){
        movieImage.layer.cornerRadius = 10
    }    //MAHMOUD:-image

    
    
}


    

