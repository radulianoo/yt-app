//
//  Model.swift
//  ytapp
//
//  Created by Octav Radulian on 08.03.2023.
//

import Foundation

///for the delegate property we need to declare the protocol, our function will have a parameter that will take an array of Videos (as we have in our decoded data)
protocol ModelDelegate {
    func videosFetched(_ videos: [Video])
}


///in the model class we will make the api call
class Model {
    
    ///in order to fetch the data and use the delegation pattern (and set the viewController as the delegate) we need to create a delegate property
    var delegate: ModelDelegate?
    
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
            
            do {
                ///parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                //due to the try we need to wrap this in a do block
                let response = try decoder.decode(Response.self, from: data!)
                
                ///because response.items can be nil we need to check it
                if response.items != nil  {
                    
                    DispatchQueue.main.async {
                        ///called the videosFetched method of the delegate
                        self.delegate?.videosFetched(response.items!)
                    }
                    
                }
                
                //dump(response)
            }
            catch {
                
            }
            
        }
        
        /// Start or Kick off the task
        dataTask.resume()
        
    }
    
}
