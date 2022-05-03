//
//  Contacts.swift
//  temp
//
//  Created by administrator-zou on 2022/4/26.
//

import SwiftUI

struct Contacts: View {
    var body: some View {
        All_brief_messages_view().padding(.vertical).default_color()
    }
}

struct Contacts_Previews: PreviewProvider {
    static var previews: some View {
        Contacts()
    }
}
