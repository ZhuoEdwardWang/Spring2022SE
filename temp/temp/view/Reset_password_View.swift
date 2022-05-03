//
//  Reset_password_View.swift
//  temp
//
//  Created by administrator-zou on 2022/5/3.
//

import SwiftUI

struct Reset_password_View: View {
    @State var error_message: String = ""
    @State var new_password: String = ""
    @State var new_password_2: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
            HStack {
                HStack {
                    Text("Password:").font(.body)
                    Spacer()
                }.frame(width:90)
                
                TextField("", text: $new_password).onSubmit{
                    
                }.lineLimit(1)
                
            }.padding(.horizontal).frame(width:.infinity)
            
            Divider()
            HStack {
                HStack {
                    Text("Confirm:").font(.body)
                    Spacer()
                }.frame(width: 90)
                
                TextField("", text: $new_password_2).onSubmit{
                    new_password_entered()
                }.lineLimit(1)
            }.padding(.horizontal).frame(width:.infinity)
            
            Divider()
            Text(error_message).padding()
            
            Spacer()
            
            
            
        }.navigationBarItems(
            trailing: Button("Done") {
                new_password_entered()
            }.small_blue()
        ).navigationBarTitle("Set password").default_color()
    }
    
    
    func new_password_entered(){
        if new_password.isEmpty || new_password_2.isEmpty{
            error_message = "password cannot be empty"
        }else if new_password != new_password_2{
            error_message = "password don't match"
        }else{
            error_message = ""
            dismiss()
            update_password(this_user.get_id(), new_password)
        }
    }
}

struct Reset_password_View_Previews: PreviewProvider {
    static var previews: some View {
        Reset_password_View()
    }
}
