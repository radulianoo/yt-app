//
//  Video.swift
//  ytapp
//
//  Created by Octav Radulian on 08.03.2023.
//

import Foundation
///this struct will represent a video from the youtube playlist that we are searching for
struct Video: Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        ///these cases are the path in our json to reach our properties
        case snippet
        case thumbnails
        case high
        case resourceId
        
        ///we declare the keys that we are interested in
        case published = "publishedAT"
        case title
        case description
        case thumbnail = "url"
        case videoId
        
    }
    
    ///below we will write the decoding instructions for our properties
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        //parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        //parse the publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        //parse thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        //parse videoId
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}
