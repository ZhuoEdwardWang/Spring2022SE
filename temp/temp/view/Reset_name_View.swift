//
//  Reset_name_View.swift
//  temp
//
//  Created by administrator-zou on 2022/5/3.
//

import SwiftUI

struct Reset_name_View: View {
    @State var new_name:String = this_user.get_name()
    @State var error_message: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            
            TextField("", text: $new_name).onSubmit{
                new_name_entered()
            }.lineLimit(1).padding().background(.white).frame(width:.infinity, height: 50)
            Text(error_message).padding()
            Spacer()
            
            
        }.navigationBarItems(
            trailing: Button("Done") {
                new_name_entered()
            }.small_blue()
        ).navigationBarTitle("Name").default_color()
    }
    
    func new_name_entered(){
        if new_name.isEmpty{
            error_message = "Username cannot be empty"
        }else{
            error_message = ""
            dismiss()
            update_username(this_user.get_id(), new_name)
        }
    }
}

struct Reset_name_View_Previews: PreviewProvider {
    static var previews: some View {
        Reset_name_View()
    }
}
