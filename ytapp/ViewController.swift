//
//  ViewController.swift
//  ytapp
//
//  Created by Octav Radulian on 07.03.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
   
    
    @IBOutlet var tableView: UITableView!
    
    let model = Model()
    ///we need to create a variable that will hold the videos array, we start with an empty one
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set itself as the dataSource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        ///set itself as the delegate of the model
        model.delegate = self
        
        model.getVideos()
        
    }
    
    //MARK: - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        
        ///set the returned videos to our video property
        self.videos = videos
        ///refresh the tableView, and fire the below tableView methods 
        tableView.reloadData()
    }

    //MARK: - TableView Methods
    ///these are the required method for our DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ///in order to display how many rows we have we will return the count of the videos
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        ///here the tableView will display a cell for each row from the above method
        ///we need to create a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        ///after we create our cell we need to configure it later on
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
        
        
        ///and return the cell
        return cell
        
    }
    
    ///this is a method that is required for handeling user interactions (delegate protocol)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

