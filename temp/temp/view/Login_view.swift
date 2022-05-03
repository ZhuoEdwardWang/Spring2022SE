//
//  login_page.swift
//  temp
//
//  Created by administrator-zou on 2022/3/17.
//

import SwiftUI

struct Login_view: View {
    enum Item: Hashable {
            case email
            case password
        }
    
    
    @Binding var logged_in: Bool
    @State var root_is_active_1: Bool = false
    @State var root_is_active_2: Bool = false
    @State private var email_address: String = ""
    @State private var password: String = ""
    @State private var error_message: String = ""
    @State var is_active_1 = false
    @State var is_active_2 = false
    //@FocusState var focusedField: Itemz
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                //Spacer().frame(height:75)
                
                VStack(spacing: 20.0){
                    Image("次生银翼").resizable(resizingMode: .stretch).aspectRatio(contentMode: .fit).frame(width:150, height: 150)
                    
                    VStack {
                        
                        
                        VStack {
                            Divider()
                            
                            HStack(spacing: 10.0) {
                                Text("Email:").font(.body).lineLimit(1).frame(width:100,alignment: .leading)
                                
                                TextField("Enter email", text: $email_address)
                                    .font(.body)
                                    .lineLimit(1)//.focused($focusedField, equals: .email)
                                
                                
                            }
                            
                            Divider()
                            
                            HStack(spacing: 10.0) {
                                Text("Password:").font(.body).lineLimit(1).frame(width:100,alignment:.leading)
                                SecureField("Enter password", text: $password)
                                    .font(.body)
                                    .lineLimit(1)
                            }.onSubmit{
                                if(password.isEmpty || email_address.isEmpty){
                                    
                                }else{
                                    perform_log_in_function()
                                }
                            }//.focused($focusedField, equals: .password)
                            
                            Divider()
                            
                        }
                        
            
                        
                        HStack {
                            HStack {
                                NavigationLink(destination: Forget_password_view(root_is_active: self.$root_is_active_1).onAppear{
                                    error_message = ""
                                },isActive: $is_active_1) {
                                    EmptyView().opacity(0.0)
                                }.isDetailLink(false)
                                
                                
                                Text("Forget password").font(.footnote).foregroundColor(.black).onTapGesture {
                                    is_active_1 = true
                                    //error_message = ""
                                }
                            }
                            
                            
                            
                            Spacer()
                            HStack {
                                NavigationLink(destination: Create_account_view(root_is_active: self.$root_is_active_2).onAppear{
                                    error_message = ""
                                },isActive: $is_active_2) {
                                    EmptyView().opacity(0.0)
                                }.isDetailLink(false)
                                
                                Text("New account").foregroundColor(.black).font(.footnote).onTapGesture {
                                    is_active_2 = true
                                    //error_message = ""
                                }
                            }
                        }
                    }
                    HStack {
                        Text(error_message).font(.footnote)
                        //Spacer()
                    }.padding()
                }
                
                
                Spacer()
                
                Button("Log in") {
                    perform_log_in_function()
                }.big_brown()
                
                Spacer().frame(height:75)
                
            }.padding(.horizontal, 20.0)
        }
    }
    
    func perform_log_in_function(){
        error_message = ""
        logged_in = true
        return
        
        if email_address.isEmpty {
            //focusedField = .email
            error_message = "Please enter your email"
        } else if password.isEmpty {
            //focusedField = .password
            error_message = "Plese enter your password"
        } else if !email_exist(email_address){
            error_message = "Email doesn't exist"
        }else if !email_password_match(email_address, password){
            error_message = "Email password doesn't match"
        }else{
            error_message = ""
            logged_in = true
            log_in(email_address,password)
        }
    }
}

/*
struct enter_filed: View{
    @State private var email_address: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack(alignment: .center, spacing: 50.0) {
            
            Image("次生银翼").resizable(resizingMode: .stretch).aspectRatio(contentMode: .fit).frame(width:150)
            
            VStack {
                Divider()
                HStack(spacing: 10.0) {
                    Text("Email:").font(.footnote).lineLimit(1).frame(width:70,alignment: .leading)
                    TextField("Enter email", text: $email_address)
                        .font(.footnote)
                        .lineLimit(/*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                }
                Divider()
                    
                HStack(spacing: 10.0) {
                    Text("Password:").font(.footnote).lineLimit(1).frame(width:70,alignment:.leading)
                    TextField("Enter password", text: $password)
                        .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
                        .lineLimit(/*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                }
                Divider()
                HStack {
                    Button("Forget password") {
                        
                    }.font(.caption2).foregroundColor(.black)
                    Spacer()
                    Button("New account") {
                        
                    }.foregroundColor(.black).font(.caption2)
                }
            }
            
            
            Button("Log in") {
                
            }.foregroundColor(.white).frame(width:200,height: 30).background(.brown).cornerRadius(8).font(.body)
            
        }
    }
}
 */
struct Login_page_Previews: PreviewProvider {
    @State static var test: Bool = true
    static var previews: some View {
        Login_view(logged_in: $test)
    }
}
