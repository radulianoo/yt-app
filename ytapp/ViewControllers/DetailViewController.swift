//
//  DetailViewController.swift
//  ytapp
//
//  Created by Octav Radulian on 10.03.2023.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var webView: WKWebView!
    @IBOutlet var textView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        ///Clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        
        ///Check if there is a view
        guard video != nil else { return }
        
        ///Create the embeded URL
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        ///Load it into webView
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        ///Set the title
        titleLabel.text = video!.title
        
        ///Set the date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = dateFormatter.string(from: video!.published)
        
        ///Set the description
        textView.text = video!.description
    }
    
}
