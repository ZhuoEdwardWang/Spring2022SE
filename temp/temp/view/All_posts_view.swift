//
//  All_posts.swift
//  temp
//
//  Created by administrator-zou on 2022/4/12.
//

import SwiftUI

struct All_posts_view: View {
    var body: some View {
        /*
        List(All_posts_model){
            Single_post_model in
            Single_post_view(single_post_model: Single_post_model)
        }.listStyle(PlainListStyle())
         */
        VStack {
            ScrollView(.vertical, showsIndicators: true){
                ZStack {
                    VStack {
                        Image("wallpaper").resizable(resizingMode: .stretch).aspectRatio(contentMode:.fit).frame(width:.infinity)
                        Spacer().frame(height:40)
                    }
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text(this_user.get_name()).foregroundColor(.white).font(.headline)
                            this_user.get_photo().resizable(resizingMode: .stretch).aspectRatio(contentMode:.fit).frame(width:75).clipShape(Rectangle()).background(.white)
                            

                        }.padding()
                    }
                }
            
                
                ForEach(All_posts_model){Single_post_model in
                    Single_post_view(single_post_model: Single_post_model).padding(.horizontal, 10.0)
                    Divider()
                }
            }
        }.background(.white)
    }
}

struct All_posts_Previews: PreviewProvider {
    static var previews: some View {
        All_posts_view()
    }
}
