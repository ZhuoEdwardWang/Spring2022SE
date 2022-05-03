//
//  Single_chat_history.swift
//  temp
//
//  Created by administrator-zou on 2022/3/26.
//

import Foundation
import SwiftUI

var all_chat_message_model: [chat_history] = load_all_chat_history()

protocol chat_history{
    var id: Int {get}
    var chat_history: [Single_chat_message_model] {get}
    
    func get_preview_image() -> Image
    
    func get_preview_name() -> String
}

extension chat_history{
    func get_id() -> Int{
        return id
    }
    
    func get_preview_message() -> String{
        return chat_history.last!.get_content()
    }
    
    func get_preview_time() -> Date{
        return chat_history.last!.get_sending_time()
    }
    
    func get_chat_history() -> [Single_chat_message_model]{
        return chat_history
    }
}

struct Single_chat_history_model: Identifiable, chat_history{
    
    //Not the user Id, not the other ID, it's the ID of the chat message
    //Each communication between two users should have a distinct ID
    var id: Int
    var sender_1: Int
    var sender_2: Int
    
    var chat_history: [Single_chat_message_model]
    
    //should be modified later to assign user id
    init(_ id : Int, _ sender_1:Int, _ sender_2:Int, _ single_chat_history: [Single_chat_message_model]) {
        self.id = id
        self.sender_1 = sender_1
        self.sender_2 = sender_2
        self.chat_history = single_chat_history
    }
    
        
    func get_preview_image() -> Image {
        if sender_1 == this_user.id{
            return get_user_picture_from_user_id(sender_2)
        }else{
            return get_user_picture_from_user_id(sender_1)
        }
    }
    
    func get_preview_name() -> String {
        if sender_1 == this_user.id{
            return get_user_name_from_user_id(sender_2)
        }else{
            return get_user_name_from_user_id(sender_1)
        }
    }
}



struct Single_chat_history_group_model: Identifiable, chat_history{

    //the ID of the chat message
    //Each communication between two users should have a distinct ID
    var id: Int
    var chat_name: String
    var chat_picture: Image
    var chat_members: [Int] = []
    //chat_members contains the id of all members, temporarily empty
    
    
    var chat_history: [Single_chat_message_model]
    
    init(_ id : Int, _ single_chat_history: [Single_chat_message_model]) {
        self.id = id
        self.chat_name = get_chat_name_from_chat_id(id)
        self.chat_picture = get_chat_picture_from_chat_id(id)
        self.chat_history = single_chat_history
    }
        
    func get_preview_image() -> Image {
        return chat_picture
    }
    
    func get_preview_name() -> String {
        return chat_name
    }
    
}
