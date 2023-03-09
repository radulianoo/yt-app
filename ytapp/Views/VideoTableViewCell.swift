//
//  VideoTableViewCell.swift
//  ytapp
//
//  Created by Octav Radulian on 09.03.2023.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet var thumbnailImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v: Video) {
        
        self.video = v
        
        ///ensure that we have a video
        guard self.video != nil else { return }
        ///set the title
        self.titleLabel.text = video?.title
        ///set the date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = dateFormatter.string(from: video!.published)
        
        ///set the thumbnail
        guard self.video!.thumbnail != "" else { return }
        
        ///check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            ///set the thumbnail imageView
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
            
        }
        
        ///download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        //get the shared URL session object
        let session = URLSession.shared
        //create a data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil  {
                
                //save the data in the cahce
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                //check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                if url?.absoluteString != self.video?.thumbnail {
                    //video cell has been recicled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                //create the image object
                let image = UIImage(data: data!)
                //set the imageView
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        ///start the data task
        dataTask.resume()
        
    }

}
