//
//  Model.swift
//  ytapp
//
//  Created by Octav Radulian on 08.03.2023.
//

import Foundation
///in the model class we will make the api call
class Model {
    
    func getVideos() {
        
        /// Create the URL Object
        let url = URL(string: Constants.API_URL)
        //this creates an optional url object so we need to guard it
        guard url != nil else { return }
        
        /// Get a URLSession Object
        let session = URLSession.shared
        
        /// Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { data, response, error in
            ///check if there were any errors
            if error != nil || data ==  nil { return }
            
            ///parsing the data into video objects
        }
        
        /// Start or Kick off the task
        dataTask.resume()
        
    }
    
}
