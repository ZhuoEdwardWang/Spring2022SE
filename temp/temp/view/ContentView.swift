//
//  ContentView.swift
//  temp
//
//  Created by administrator-zou on 2022/3/15.
//

import SwiftUI
struct ContentView: View {
    @State var logged_in = false
    var body: some View {
        ZStack {
            Login_view(logged_in:$logged_in).disabled(logged_in).opacity(get_opacity_log_in(logged_in))
            Integrate_view(logged_in: $logged_in).disabled(!logged_in).opacity(get_opacity_main(logged_in))
        }
    }
    
    
    func get_opacity_main(_ if_logged_in:Bool) -> Double{
        switch logged_in {
            case true:
                return 100.0
            default:
                return 0.0
        }
    }
    
    func get_opacity_log_in(_ if_logged_in: Bool) -> Double{
        switch logged_in {
            case true:
                return 0.0
            default:
                return 100.0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
            
    }
}
