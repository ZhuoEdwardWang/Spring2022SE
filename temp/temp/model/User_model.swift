//
//  User_profile_model.swift
//  temp
//
//  Created by administrator-zou on 2022/3/27.
//

import Foundation
import SwiftUI

protocol user_profile:Identifiable{
    var id: Int {get}
    var user_name: String {get}
    var user_profile_picture: Image {get}
}

extension user_profile{
    func get_photo() -> Image{
        return user_profile_picture
    }
    
    func get_name() -> String{
        return user_name
    }
    
    func get_id() -> Int{
        return id
    }
}

struct User_model:Identifiable,user_profile{
    //The User ID
    var id: Int
    var user_name: String
    var user_profile_picture: Image
    
    init(_ id: Int) {
        self.id = id
        self.user_name = get_user_name_from_user_id(id)
        self.user_profile_picture = get_user_picture_from_user_id(id)
    }
}

var this_user = load_this_user()
struct Special_user_model:Identifiable,user_profile{
    //The User ID
    var id: Int
    var user_name: String
    var user_profile_picture: Image
    
    init(_ id: Int) {
        self.id = id
        self.user_name = get_user_name_from_user_id(id)
        self.user_profile_picture = get_user_picture_from_user_id(id)
    }
}
