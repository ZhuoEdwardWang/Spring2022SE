//
//  Single_post_model.swift
//  temp
//
//  Created by administrator-zou on 2022/3/26.
//

import Foundation
import SwiftUI
var All_posts_model: [Single_post_model] = load_posts()



struct Single_post_model:Identifiable{
    //The post ID
    var id: Int
    
    //Allowing the navigation the user's profile page
    //name and picture depending on user ID
    var sender_id: Int
    
    var message: String
    var post_time: Date
    
    init(_ id : Int, _ sender_id: Int, _ message:String, _ post_time:Date) {
        self.id = id
        self.sender_id = sender_id
        self.message = message
        self.post_time = post_time
    }
}
