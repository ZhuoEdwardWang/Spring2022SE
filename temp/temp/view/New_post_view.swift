//
//  New_post_view.swift
//  temp
//
//  Created by administrator-zou on 2022/5/2.
//

import SwiftUI

struct New_post_view: View {
    @State var message: String = ""
    var body: some View {
        VStack {
            TextEditor(text: $message).frame(width:.infinity, height: 200).padding()
            Divider()
            
            Spacer()
        }
    }
}

struct New_post_view_Previews: PreviewProvider {
    static var previews: some View {
        New_post_view()
    }
}
