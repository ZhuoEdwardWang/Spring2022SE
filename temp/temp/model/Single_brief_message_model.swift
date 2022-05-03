//
//  Single_message_model.swift
//  temp
//
//  Created by administrator-zou on 2022/3/26.
//

import Foundation
import SwiftUI

protocol brief_message_model:Identifiable{
    var id: Int { get }
    var name: String { get }
    var message: String { get }
    var message_time: Date { get }
    var picture: Image { get }
}

extension brief_message_model{
    func get_photo() -> Image{
        return picture
    }
    
    func get_name() -> String{
        return name
    }
    
    func get_id() -> Int{
        return id
    }
    
    func get_message() -> String {
        return message
    }
    
    func get_time() -> Date {
        return message_time
    }
}

struct Single_brief_message_model:brief_message_model, Identifiable{
    //The message ID
    //Should be unique for each pair of users
    var id: Int
    var name: String
    var message: String
    var message_time: Date
    
    var picture: Image
    
    init(_ id: Int, _ name: String, _ message: String, _ message_time: Date, _ picture: Image) {
        self.id = id
        self.name = name
        self.message = message
        self.message_time = message_time
        self.picture = picture
    }
}


///#####

var All_brief_messages_model: [Single_brief_message_model] = load_messages(all_chat_message_model)

func load_messages(_ all_chat_history: [chat_history]) -> [Single_brief_message_model] {
    var output: [Single_brief_message_model] = []
    
    for single_chat_history in all_chat_history{
        
        let temp = Single_brief_message_model(
            single_chat_history.get_id(),
            single_chat_history.get_preview_name(),
            single_chat_history.get_preview_message(),
            single_chat_history.get_preview_time(),
            single_chat_history.get_preview_image())
        
        
        output.append(temp)
    }
    return output
}
