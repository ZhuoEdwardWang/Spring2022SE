//
//  DAO.swift
//  temp
//
//  Created by administrator-zou on 2022/3/27.
//

import Foundation
import SwiftUI

//#################################################
//check if a email is created for an account in the server's database
func email_exist(_ email: String) -> Bool{
    return true
}

func email_password_match(_ email: String, _ password: String) -> Bool{
    return true
}

//the sever will create a verification code and send the verification code to the user
//the sever will check if the verfication code match with the user's email
func email_verification_code_match(_ email:String, _ verification_code: String) -> Bool{
    return true
}


//user log in successfully, initialize data
func log_in(_ email:String, _ password:String){
    
}

func create_account(_ email: String, _ password:String){
    
}
func new_verification_code(_ email: String){
    
}

//send a new auto_genereated password to the user's email
func new_password_to_account(_ email: String){
    
}

//##############################################################################################
//updation method. All functions should update local database, then synchronize remote database with local database
func new_message(history_id chat_history_id: Int, sender_ID sender_id: Int, time sending_time: Date, text message: String){
    
}

func new_post(sender_ID sender_id: Int, time sending_time: Date, text message: String){
    
}

func verify_user() -> Bool{
    return true
}

func update_password(_ user_id:Int, _ new_password:String){
    
}

func update_username(_ user_id: Int, _ new_name:String){
    
}

//##################################################

func get_user_name_from_user_id(_ id: Int) -> String{
    return "Bronya"
}

func get_user_picture_from_user_id(_ id: Int) -> Image{
    return Image("次生银翼")
}


func get_associated_chat_id_from_user_id(_ user_id: Int) -> [Int]{
    return [0,1,2]
}

func get_chat_type_from_id(_ id: Int) -> Int{
    return 0
}


func get_chat_name_from_chat_id(_ id: Int) -> String {
    switch id {
        case 0:
            return "A"
        case 1:
            return "B"
        case 2:
            return "C"
        default:
            return "D"
    }
}

func get_chat_history_from_user_ids(_ user_id_1: Int, _ user_id_2: Int) -> chat_history{
    var chat_id : Int
    switch user_id_2{
        case 1:
            chat_id = 0
        case 2:
            chat_id = 1
        case 3:
            chat_id = 2
        default:
            chat_id = 0
    }
    
    return get_chat_history_from_chat_id(chat_id)!
    
}

func get_chat_picture_from_chat_id(_ id: Int) -> Image{
    return Image("次生银翼")
}


//get a chat history containning the chat id, two users id, and chat messages
func get_chat_history_from_chat_id(_ id: Int) -> chat_history?{
    let type = get_chat_type_from_id(id)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd, HH:mm"
    if type == 0{
        // the chat is a two person chat
        switch id {
        case 0:
                let chat1_1 = Single_chat_message_model(0,0, "abcdefghijklmnopqrstuvwkyz", dateFormatter.date(from:"2022/04/20, 08:20")!)
                let chat1_2 = Single_chat_message_model(1,1, "bbb", dateFormatter.date(from:"2022/04/20, 08:20")!)
                let chat1_3 = Single_chat_message_model(2,0, "ccc" , dateFormatter.date(from:"2022/04/20, 22:20")!)
                let single_chat_history = Single_chat_history_model(0,0,1,[chat1_1,chat1_2,chat1_3])
                return single_chat_history
        
        case 1:
                let chat2_1 = Single_chat_message_model(0,0, "ddd",dateFormatter.date(from:"2022/04/20, 08:20")!)
                let chat2_2 = Single_chat_message_model(1,2, "eee", dateFormatter.date(from:"2022/04/20, 08:20")!)
                let chat2_3 = Single_chat_message_model(2,0, "fff", dateFormatter.date(from:"2022/04/20, 08:20")!)
                let single_chat_history = Single_chat_history_model(1,0,2,[chat2_1,chat2_2,chat2_3])
                return single_chat_history
        default:
                let chat3_1 = Single_chat_message_model(0,0, "ggg",dateFormatter.date(from:"2022/04/20, 08:20")!)
                let chat3_2 = Single_chat_message_model(1,3, "hhh", dateFormatter.date(from:"2022/04/20, 08:20")!)
                let chat3_3 = Single_chat_message_model(2,0, "iii", dateFormatter.date(from:"2022/04/20, 08:20")!)
                let single_chat_history = Single_chat_history_model(2,0,3,[chat3_1,chat3_2,chat3_3])
                return single_chat_history
        }
    }else{
        // the chat is a group chat
        return nil
    }
}

/*
func get_chat_history_from_chat_id(_ id: Int) -> Single_chat_history_model? {
    for single_chat_history in all_chat_message_model{
        if single_chat_history.id == id{
            return single_chat_history
        }
    }
    return nil
}
*/

//
func load_all_chat_history() -> [chat_history]{
    var output: [chat_history] = []
    let chat_histories = get_associated_chat_id_from_user_id(this_user.id)
    for single_history_id in chat_histories{
        let query_result = get_chat_history_from_chat_id(single_history_id)
        output.append(query_result!)
    }
    return output
                
}


func load_posts () -> [Single_post_model] {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd, HH:mm"
    
    return [Single_post_model(0,1,"次生银翼保佑我写软件不出bug，拜托了另一个我",dateFormatter.date(from:"2022/04/20, 08:20")!),
            Single_post_model(1,1,"次生银翼保佑我写软件不出bug",dateFormatter.date(from:"2022/04/20, 08:20")!),
            Single_post_model(2,1,"次生银翼保佑我写软件不出bug",dateFormatter.date(from:"2022/04/20, 08:20")!),
            Single_post_model(3,1,"次生银翼保佑我写软件不出bug",dateFormatter.date(from:"2022/04/20, 08:20")!),
            Single_post_model(4,1,"次生银翼保佑我写软件不出bug",dateFormatter.date(from:"2022/04/20, 08:20")!),
            Single_post_model(2,1,"次生银翼保佑我写软件不出bug",dateFormatter.date(from:"2022/04/20, 08:20")!),
            Single_post_model(3,1,"次生银翼保佑我写软件不出bug",dateFormatter.date(from:"2022/04/20, 08:20")!),
            Single_post_model(4,1,"次生银翼保佑我写软件不出bug",dateFormatter.date(from:"2022/04/20, 08:20")!)
    ]
}
func get_user_profile_from_user_id(_ id: Int) -> User_model{
    return User_model(id)
}

func load_this_user() -> Special_user_model{
    return Special_user_model(0)
}

