//
//  Create_account_verification_view.swift
//  temp
//
//  Created by administrator-zou on 2022/5/3.
//

import SwiftUI

struct Create_account_verification_view: View {
    @Binding var email_address: String
    @Binding var password: String
    @Binding var root_is_active: Bool

    @State private var verification_code: String = ""
    @State private var error_message: String = ""
    var body: some View {
        VStack{
            Spacer().frame(height:75)
            VStack(spacing: 20.0){
                Text("Please enter your verification code").font(.title3)
                VStack {
                    Divider()
                    HStack(spacing: 10.0) {
                        Text("Code:").font(.body).lineLimit(1).frame(alignment: .leading)
                        TextField("Enter verification code", text: $verification_code)
                            .font(.body)
                            .lineLimit(1).onSubmit{
                                if !verification_code.isEmpty {
                                    perform_verify_action()
                                }
                            }
                    }
                    Divider()
                }
                Text(error_message).font(.footnote).padding()
            }
            Spacer()
            
            ZStack {
                
                Button("Continue") {
                    perform_verify_action()
                }.big_brown()
            }
            
            Spacer().frame(height:75)
        }
        .padding(.horizontal, 20.0)
    }
    
    func perform_verify_action(){
        //error_message = ""
        //self.root_is_active = false
        //return
        
        if verification_code.isEmpty {
            error_message = "Verification code cannot be empty"
        }else if !email_verification_code_match(email_address,verification_code){
            error_message = "Incorrect verification code"
        }else{
            error_message = ""
            self.root_is_active = false
            create_account(email_address, password)
            //new_password_to_account(emmail_address)
        }
    }
    
}

struct Create_account_verification_view_Previews: PreviewProvider {
    @State static var temp: String = "123456@163.com"
    @State static var temp2: String = "qazwsxedc"
    @State private static var is_active:Bool = true
    static var previews: some View {
        Create_account_verification_view(email_address: $temp, password: $temp2, root_is_active: $is_active)
    }
}
