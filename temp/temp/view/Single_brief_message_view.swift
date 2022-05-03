//
//  Single_message_view.swift
//  temp
//
//  Created by administrator-zou on 2022/3/26.
//

import SwiftUI
import Foundation
struct Single_brief_message_view: View {
    let message_model: Single_brief_message_model
    
    var body: some View {
        HStack(alignment: .center, spacing: 10.0) {
            
            message_model.get_photo().resizable(resizingMode: .stretch).aspectRatio(contentMode: .fit).frame(width:50, height:50)
            
            VStack(alignment: .leading, spacing: 5.0) {
                HStack {
                    
                    Text(message_model.get_name())
                        .font(.body).frame(alignment:.leading).lineLimit(1)
                    Spacer()
                    
                    
                    Text(get_string_from_date(date: message_model.get_time())).font(.footnote).frame(alignment:.trailing)
                        .lineLimit(1)
                        .foregroundColor(Color.gray)
                }
                
                Text(message_model.get_message()).font(.callout)
                    .lineLimit(1).foregroundColor(Color.gray)
                
            }.frame(width:.infinity, height: 50)
            
        }
    }
}

struct Single_message_view_Previews: PreviewProvider {
    static var previews: some View {
        Single_brief_message_view(message_model: All_brief_messages_model[0]).padding(.horizontal, 10)
    }
}
