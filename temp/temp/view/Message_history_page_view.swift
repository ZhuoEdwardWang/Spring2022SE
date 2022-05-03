//
//  Message_history_page_view.swift
//  temp
//
//  Created by administrator-zou on 2022/4/26.
//

import SwiftUI

struct Message_history_page_view: View {
    var chat_history: chat_history
    @State var message: String = ""
    var body: some View {
        VStack {
            Single_chat_history_view(single_chat_history_model: chat_history)
            Spacer()
            
            HStack {
                TextField("", text: $message).padding([.top, .leading, .bottom], 20.0).frame(height: 50).textFieldStyle(RoundedBorderTextFieldStyle()).onSubmit{
                    send_action_performed()
                }
                
                Button("Send") {
                    send_action_performed()
                }.small_blue()
                
            }.padding(.horizontal).background(.white)
            
        }.default_color()
    }
    
    func send_action_performed(){
        let chat_id: Int = chat_history.get_id()
        let sender_id: Int = this_user.get_id()
        let sending_time: Date = Date()
        let text = message
        new_message(history_id: chat_id, sender_ID: sender_id, time: sending_time, text: text)
    }
}

struct Message_history_page_view_Previews: PreviewProvider {
    static var previews: some View {
        Message_history_page_view(chat_history:all_chat_message_model[0])
    }
}
