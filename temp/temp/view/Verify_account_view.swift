//
//  Verify_account_view.swift
//  temp
//
//  Created by administrator-zou on 2022/5/3.
//

import SwiftUI

struct Verify_account_view: View {
    @State var error_message: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Spacer()
            Button("Verify Account") {
                verify_button_pressed()
            }.big_brown()
            Text(error_message).padding().frame(width: .infinity, height: 50)
        }.navigationBarTitle("Set password")
    }
    
    func verify_button_pressed(){
        let verify_successfully = verify_user()
        if verify_successfully{
            error_message = "Verify Successfully"
            dismiss()
        }else{
            error_message = "Verify failed"
        }
    }
}

struct Verify_account_view_Previews: PreviewProvider {
    static var previews: some View {
        Verify_account_view()
    }
}
