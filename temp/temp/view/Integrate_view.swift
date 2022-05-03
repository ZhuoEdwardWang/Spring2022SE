//
//  Integrate_view.swift
//  temp
//
//  Created by administrator-zou on 2022/4/11.
//

import SwiftUI

struct Integrate_view: View {
    @Binding var logged_in: Bool
    @State var tab_selection: Tabs = Tabs.tab1
    //@State var new_posts_enabled: Bool = false
    //@State var button_opacity: Double = 0.0
    
    var body: some View {
        NavigationView{
            TabView(selection: $tab_selection){
                Contacts().tabItem {
                    Label("Message", systemImage: "message.fill")
                }.tag(Tabs.tab1)/*.onTapGesture {
                    new_posts_enabled = false
                    button_opacity = 0.0
                }*/
                
                Moments().tabItem {
                    Image(systemName: "location.circle")
                    Text("Discover")
                }.tag(Tabs.tab2)/*.onTapGesture {
                    new_posts_enabled = true
                    button_opacity = 100.0
                }*/
                
                Setting(logged_in: $logged_in).tabItem {
                    Label("Setting", systemImage: "person.fill")
                }.tag(Tabs.tab3)/*.onTapGesture {
                    new_posts_enabled = false
                    button_opacity = 0.0
                }*/
                
                
            }.font(.headline).navigationBarTitle(get_title(selected_tab: tab_selection),displayMode: .inline).navigationBarItems(trailing: NavigationLink(destination: New_post_view()) {
                Image(systemName: "plus.circle").disabled(tab_selection != Tabs.tab2).opacity(tab_selection == Tabs.tab2 ? 100.0 : 0.0).foregroundColor(.black)
                //Text("New post").foregroundColor(.black)
            })
        
        }
    }
    
    enum Tabs{
        case tab1, tab2, tab3
    }

    func get_title(selected_tab:Tabs) -> String{
        switch selected_tab {
            case .tab1:
                return "Chat"
            case .tab2:
                return "Moment"
            case .tab3:
                return "Setting"
        }
            
    }
    
}

struct Integrate_view_Previews: PreviewProvider {
    @State static var test: Bool = true
    static var previews: some View {
        Integrate_view(logged_in: $test)
    }
}
