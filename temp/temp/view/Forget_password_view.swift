//
//  Forget_password_view.swift
//  temp
//
//  Created by administrator-zou on 2022/3/27.
//

import SwiftUI

struct Forget_password_view: View {
    @Binding var root_is_active: Bool
    @State private var email_address: String = ""
    @State private var error_message: String = ""
    @State private var to_navigate: Bool = false
    var body: some View {
        VStack{
            Spacer().frame(height:75)
            VStack(spacing: 20.0){
                Text("Please enter your email").font(.title3)
                
                VStack {
                    Divider()
                    HStack(spacing: 10.0) {
                        Text("Email:").font(.body).lineLimit(1).frame(alignment: .leading)
                        TextField("Enter email", text: $email_address)
                            .font(.body)
                            .lineLimit(/*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/).onSubmit{
                                if !email_address.isEmpty{
                                    perform_forget_action()
                                }
                            }
                    }
                    Divider()
                }
                Text(error_message).font(.footnote).padding()
            }
            
            Spacer()
            VStack {
                NavigationLink(destination: Forget_password_verfication_view(email_address: $email_address, root_is_active: self.$root_is_active), isActive: $to_navigate) { EmptyView().opacity(0.0) }.isDetailLink(false)
                
                
                Button("Continue") {
                    perform_forget_action()
                }.big_brown()
            }
            
            Spacer().frame(height:75)
        }
        .padding(.horizontal, 20.0)
    }
    
    func perform_forget_action(){
        
        //to_navigate = true
        //return
        
        if email_address.isEmpty {
            error_message = "Email cannot be empty"
        }else if !vaild_email(email_address){
            error_message = "Invalid email format"
        }else if !email_exist(email_address){
            error_message = "Account doesn't exist"
        }else{
            error_message = "Verificaion code has been send to email"
            new_verification_code(email_address)
            to_navigate = true
        }
    }
}

struct Forget_password_view_Previews: PreviewProvider {
    @State private static var is_active:Bool = true
    static var previews: some View {
        Forget_password_view(root_is_active: $is_active)
    }
}
