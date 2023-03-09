//
//  Response.swift
//  ytapp
//
//  Created by Octav Radulian on 09.03.2023.
//

import Foundation
///in order to have the data for the json first we will get the big json
struct Response: Decodable {
    
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decodeIfPresent([Video].self, forKey: .items)
    }
}
