//
//  Personal_profile_view.swift
//  temp
//
//  Created by administrator-zou on 2022/5/2.
//

import SwiftUI

struct Personal_profile_view: View {
    var body: some View {
        VStack {
            List(){
                Section(){
                    HStack {
                        Text("Profile Photo")
                        Spacer()
                        this_user.get_photo().resizable(resizingMode: .stretch).aspectRatio(contentMode: .fit).frame(width:75, height: 75)
                    }
                    
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(this_user.get_name()).lineLimit(1)
                    }
                    
                    HStack{
                        Text("ID")
                        Spacer()
                        Text(String(this_user.get_id()))
                    }
                    
                    HStack{
                        Text("Change password")
                        Spacer()
                    }
                    
                    HStack{
                        Text("Verify Account")
                        Spacer()
                    }
                }
                /*
                Section {
                    
                    Text("Verify Account").onTapGesture {
                        verify_button_pressed()
                    }
                    
                    Text("Log Out").onTapGesture {
                        log_out_button_pressed()
                    }
                }
                 */
            }.listStyle(PlainListStyle()).font(.body)
        }/*.onAppear(perform: {
            UITableView.appearance().contentInset.top = -35
        }).onDisappear(perform: { UITableView.appearance().contentInset.top = 0 })*/
        // move the sections up by 35 when show up
        // move down when disappear
    }
}

struct Personal_profile_view_Previews: PreviewProvider {
    static var previews: some View {
        Personal_profile_view()
    }
}
