//
//  Profile_view.swift
//  temp
//
//  Created by administrator-zou on 2022/3/26.
//

import SwiftUI

struct Profile_view: View {
    var user_profile: User_model
    var body: some View {
        
        VStack{
            Spacer().frame(height:75)
            
            VStack(spacing: 30.0) {
                user_profile.get_photo().resizable(resizingMode: .stretch).aspectRatio(contentMode: .fit).frame(width:150).clipShape(Circle())
                Text(user_profile.get_name()).font(.title)
                Text(String(user_profile.get_id())).font(.body)
            }
            Spacer()
            
            NavigationLink(destination: Single_chat_history_view(single_chat_history_model: get_chat_history_from_user_ids(this_user.get_id(), user_profile.get_id())).navigationBarTitle(user_profile.get_name())) {
                Text("Message").foregroundColor(.white).frame(width:200,height: 50).background(.blue).cornerRadius(8).font(.body)
            }
        
            
            Spacer().frame(height:75)
        }
        
        
    }
}

struct Profile_view_Previews: PreviewProvider {
    static var previews: some View {
        Profile_view(user_profile: User_model(0))
    }
}
