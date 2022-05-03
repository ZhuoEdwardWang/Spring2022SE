//
//  Single_post.swift
//  temp
//
//  Created by administrator-zou on 2022/3/15.
//

import SwiftUI

struct Single_post_view: View{
    var single_post_model: Single_post_model
    var body: some View {
        HStack(alignment: .top, spacing: 10.0){
            
            
            ZStack {
                NavigationLink(destination: Profile_view(user_profile: get_user_profile_from_user_id(single_post_model.sender_id))){
                    
                    get_user_picture_from_user_id(single_post_model.sender_id) .resizable(resizingMode: .stretch).aspectRatio(contentMode: .fit)
                    }
            }.frame(width:50,height:50)
            
            
            VStack(alignment: .leading, spacing:5) {
                
                NavigationLink(destination: Profile_view(user_profile: get_user_profile_from_user_id(single_post_model.sender_id))){
                    
                    Text(get_user_name_from_user_id(single_post_model.sender_id)).font(.body).fontWeight(.bold).foregroundColor(Color(hue: 0.6, saturation: 0.8, brightness: 0.5)).frame(height:25)
                    
                }
                
                Text(single_post_model.message).font(.body)
                
                HStack {
                    Text(get_string_from_date(date: single_post_model.post_time)).font(.callout).frame(height:20).foregroundColor(Color.gray)
                    
                    //Spacer()
                    /*
                    Button("··") {
                        
                    }.font(.callout).foregroundColor(Color.gray).background(Color.clear).frame(width:40)
                    */
                }
            }
        Spacer()
        }.frame(width:.infinity)
        
    }
}

/*
struct Navigable_picture: View{
    var picture: Image
    var id: Int
    var body: some View {
        ZStack {
            picture.resizable(resizingMode: .stretch).aspectRatio(contentMode: .fit)
            
            NavigationLink(destination: Profile_view(user_profile: get_user_profile_from_user_id(id))){
                EmptyView()
            }.opacity(0.0)
                
        }.frame(width:50,height:50)
    }
}
*/
 
struct Single_post_Previews: PreviewProvider {
    static var previews: some View {
        Single_post_view(single_post_model: All_posts_model[0])
    }
}
