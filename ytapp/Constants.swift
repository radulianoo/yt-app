//
//  Constants.swift
//  ytapp
//
//  Created by Octav Radulian on 08.03.2023.
//

import Foundation
///folder of constants - this values are used more than one
///api key , url to acess etc
struct Constants {
    
    //we are marking these variables as static
    //by marking them with static, that property belongs to the type itself (the struct Constants)
    //not to the istance not to the instance created by the Constants blueprint
    
    static var API_KEY = "[AIzaSyBnPlDb6LnncrdGv3OhuHaTwrMTOZP_LtQ]"
    static var PLAYLIST_ID = "PLMRqhzcHGw1aLoz4pM_Mg2TewmJcMg9ua"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
}
