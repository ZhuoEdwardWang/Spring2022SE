//
//  Forget_pass_word_view.swift
//  temp
//
//  Created by administrator-zou on 2022/3/27.
//

import SwiftUI

struct Create_account_view: View {
    @Binding var root_is_active: Bool
    @State private var email_address: String = ""
    @State private var password: String = ""
    @State private var error_message: String = ""
    @State private var to_navigate: Bool = false
    
    var body: some View {
        VStack{
            Spacer().frame(height:75)
            
            VStack(spacing: 50.0){
                Text("Create New Account").font(.title3)
                VStack {
                    Divider()
                    HStack(spacing: 10.0) {
                        Text("Email:").font(.body).lineLimit(1).frame(width:100,alignment: .leading)
                        TextField("Enter email", text: $email_address)
                            .font(.body)
                            .lineLimit(1)
                    }
                    Divider()
                    HStack(spacing: 10.0) {
                        Text("Password:").font(.body).lineLimit(1).frame(width:100,alignment:.leading)
                        SecureField("Enter password", text: $password)
                            .font(.body)
                            .lineLimit(1).onSubmit{
                                if(password.isEmpty || email_address.isEmpty){
                                    
                                }else{
                                    perform_create_action()
                                }
                                
                            }
                    }
                    Divider()
                    
                    Text(error_message).font(.footnote).padding()
                }
                
            }
            Spacer()
            VStack {
                NavigationLink(destination: Create_account_verification_view(email_address: $email_address, password: $password, root_is_active: self.$root_is_active), isActive: $to_navigate) { EmptyView().opacity(0.0) }.isDetailLink(false)
                
                    Button("Create") {
                        perform_create_action()
                    }.big_brown()
            }
            
            Spacer().frame(height:75)
            
        }.padding(.horizontal, 20.0)
        
    }
    
    func perform_create_action(){
        //error_message = ""
        //self.to_navigate = true
        //return
        
        if email_address.isEmpty {
            //focusedField = .email
            error_message = "Email cannot be empty"
        }else if password.isEmpty {
            //focusedField = .password
            error_message = "password cannot be empty"
        }else if !vaild_email(email_address){
            error_message = "Invalid email format"
        }else if email_exist(email_address){
            error_message = "Account already exist"
        }else{
            error_message = ""
            self.to_navigate = true
            new_verification_code(email_address)
            //send a verification code to the user's email
            //create_account(email_address, password)
        }
    }
    

}

struct Create_account_view_Previews: PreviewProvider {
    @State private static var is_active:Bool = true
    static var previews: some View {
        Create_account_view(root_is_active: $is_active)
    }
}
