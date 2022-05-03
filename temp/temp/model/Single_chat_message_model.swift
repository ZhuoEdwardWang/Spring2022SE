//
//  single_chat_message_model.swift
//  temp
//
//  Created by administrator-zou on 2022/3/26.
//

import Foundation
import SwiftUI
protocol chat_message_model: Identifiable{
    var id: Int { get }
    var sender_id: Int { get }
    var time: Date { get }
    func get_id() -> Int
    
    func get_sender_id() -> Int
    
    func get_sending_time() -> Date
    
    func get_content() -> String
}

extension chat_message_model{
    func get_id() -> Int{
        return id
    }
    
    func get_sender_id() -> Int {
        return sender_id
    }
    
    func get_sending_time() -> Date{
        return time
    }
}

struct Single_chat_message_model:Identifiable, chat_message_model{
    //The No.
    var id: Int
    
    //true means from the user
    //false means from the others
    var sender_id: Int
    var message: String
    //Type can be changed later
    var time: Date
    
    init(_ id: Int, _ type: Int, _ message: String, _ time: Date) {
        self.id = id
        self.sender_id = type
        self.message = message
        self.time = time
    }
    
    func get_content()-> String{
        return message
    }
    
}

