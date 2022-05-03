//
//  Single_chat_history_view.swift
//  temp
//
//  Created by administrator-zou on 2022/3/26.
//

import SwiftUI

struct Single_chat_history_view: View {
    var single_chat_history_model: chat_history
    var body: some View {
        //Text("Hello, world")
        let all_messages = single_chat_history_model.get_chat_history()

        ScrollView(.vertical, showsIndicators: true) {
            ForEach(all_messages){
                single_chat_message in
                Single_chat_message_view(single_chat_message_model: single_chat_message).listRowSeparator(.hidden).padding(.horizontal, 10.0)
            }
         }
        /*
        List(all_messages) {single_chat_message in
            
            Single_chat_message_view(single_chat_message_model: single_chat_message).listRowSeparator(.hidden)
        }.listStyle(PlainListStyle())
        */
        
    }
}

struct Single_chat_history_view_Previews: PreviewProvider {
    static var previews: some View {
        Single_chat_history_view(single_chat_history_model:all_chat_message_model[0])
    }
}
