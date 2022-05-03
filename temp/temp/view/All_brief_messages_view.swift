//
//  All_messages.swift
//  temp
//
//  Created by administrator-zou on 2022/3/26.
//

import SwiftUI

struct All_brief_messages_view: View {
    
    var body: some View {
        List {
            ForEach(All_brief_messages_model){
                Single_brief_message_model in
                
                //Works, but there could be a better way
                VStack(alignment: .leading) {
                    ZStack {
                        
                        
                        Single_brief_message_view(message_model: Single_brief_message_model)//.padding(.horizontal, 10.0)
                        
                        NavigationLink(destination: Message_history_page_view(chat_history:get_chat_history_from_chat_id(Single_brief_message_model.get_id())!).navigationBarTitle(Single_brief_message_model.name)) {
                            
                            EmptyView()
                            
                        }.opacity(0.0)
                    }
                }
            }
        }.listStyle(PlainListStyle())
        /*
        ScrollView(.vertical,showsIndicators: true){
            ForEach(All_brief_messages_model){
                Single_brief_message_model in
                
                //Works, but there could be a better way
                VStack(alignment: .leading) {
                    ZStack {
                        
                        
                        Single_brief_message_view(message_model: Single_brief_message_model).padding(.horizontal, 10.0)
                        
                        NavigationLink(destination: Message_history_page_view(chat_history:get_chat_history_from_chat_id(Single_brief_message_model.id)!).navigationBarTitle(Single_brief_message_model.name)) {
                            
                            EmptyView()
                            
                        }.opacity(0.0)
                    }
                    Divider()
                }
            }
        }.listStyle(PlainListStyle())
         */
    }
}

struct All_messages_View_Previews: PreviewProvider {
    static var previews: some View {
        All_brief_messages_view()
    }
}
