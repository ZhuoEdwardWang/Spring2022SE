//
//  Setting_view.swift
//  temp
//
//  Created by administrator-zou on 2022/5/1.
//

import SwiftUI

struct Setting: View {
    @Binding var logged_in: Bool
    var body: some View {
        VStack {
            Personal_profile_view().padding(.vertical)
            Spacer()
            
            Button("Log out") {
                self.logged_in = false
            }.big_brown()
        }.default_color()
    }
}

struct Setting_Previews: PreviewProvider {
    @State static var test: Bool = false
    static var previews: some View {
        Setting(logged_in: $test)
    }
}
