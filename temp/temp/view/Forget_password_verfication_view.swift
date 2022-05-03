//
//  Forget_password_verfication_view.swift
//  temp
//
//  Created by administrator-zou on 2022/3/27.
//

import SwiftUI

struct Forget_password_verfication_view: View {
    @Binding var email_address: String
    @Binding var root_is_active: Bool
    @State private var verification_code: String = ""
    @State private var error_message: String = ""
    //@State private var to_navigate: Bool = false
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
            new_password_to_account(email_address)
        }
    }
}

struct Forget_password_verfication_view_Previews: PreviewProvider {
    @State static var temp: String = "123456@163.com"
    @State private static var is_active:Bool = true
    static var previews: some View {
        Forget_password_verfication_view(email_address: $temp, root_is_active: $is_active)
    }
}
