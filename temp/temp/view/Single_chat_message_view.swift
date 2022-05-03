//
//  from_message.swift
//  temp
//
//  Created by administrator-zou on 2022/3/26.
//

import SwiftUI

struct Single_chat_message_view: View {
    //var state: Bool = false
    var single_chat_message_model: Single_chat_message_model
    //var single_chat_history_model: Single_chat_history_model
    
    var body: some View {
        let sender = get_user_profile_from_user_id(single_chat_message_model.sender_id)
        let sender_picture = get_user_picture_from_user_id(single_chat_message_model.sender_id)
        let sender_name = get_user_name_from_user_id(single_chat_message_model.sender_id)
        
        if single_chat_message_model.sender_id == this_user.id{
            
            HStack(alignment: .top) {
                
                Spacer()
                VStack(alignment: .trailing) {
                    Text(sender_name).foregroundColor(.gray)
                    
                    Text(single_chat_message_model.get_content()).font(.body).padding(.all, 10.0).background(Color(hue: 0.312, saturation: 0.996, brightness: 0.963)).cornerRadius(6)
                }
                
                NavigationLink(destination: Profile_view(user_profile: sender)) {
                    sender_picture.resizable(resizingMode: .stretch).aspectRatio(contentMode: .fit).frame(width:60,height:60)
                }
                
            }
            .padding(.leading, 40.0).frame(width:.infinity)
            
        }else{
            
            HStack(alignment: .top) {
                
                NavigationLink(destination: Profile_view(user_profile: sender)) {
                    sender_picture.resizable(resizingMode: .stretch).aspectRatio(contentMode: .fit).frame(width:60,height:60)
                }
                
                VStack(alignment: .leading) {
                    Text(sender_name).foregroundColor(.gray)
                    Text(single_chat_message_model.get_content()).font(.body).padding(.all, 10.0).background(Color.white).cornerRadius(6)
                }
                Spacer()
                
            }
            .padding(.trailing, 40.0).frame(width:.infinity)
        }
    }
}

struct Single_chat_message_view_Previews: PreviewProvider {
    static var previews: some View {
        Single_chat_message_view(single_chat_message_model: all_chat_message_model[0].get_chat_history()[0])
    }
}
