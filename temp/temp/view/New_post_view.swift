//
//  New_post_view.swift
//  temp
//
//  Created by administrator-zou on 2022/5/2.
//

import SwiftUI

struct New_post_view: View {
    @State var message: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            TextEditor(text: $message).frame(width:.infinity, height: 200)
            Divider()
            
            Spacer()
        }.navigationBarItems(
            trailing: Button("Post") {
                post_button_pressed()
            }.small_blue().disabled(message.isEmpty).navigationBarTitle("Text")
        ).default_color()

    }
    
    func post_button_pressed(){
        new_post(sender_ID: this_user.id, time: Date(), text: message)
        dismiss()
    }
}

struct New_post_view_Previews: PreviewProvider {
    static var previews: some View {
        New_post_view()
    }
}
