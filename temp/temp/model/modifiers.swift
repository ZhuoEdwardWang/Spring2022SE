//
//  Button_big.swift
//  temp
//
//  Created by administrator-zou on 2022/4/11.
//

import SwiftUI
import Foundation

extension Button {
    func big_brown() -> some View {
        self.foregroundColor(.white).frame(width:200,height: 50).background(.brown).cornerRadius(8).font(.headline).padding()
    }
    
    func big_white() -> some View {
        self.foregroundColor(.black).frame(width:200,height: 50).background(.white).cornerRadius(8).font(.headline).padding()
    }
    func small_blue() -> some View {
        self.foregroundColor(.white).frame(width:60,height: 35).background(.blue).cornerRadius(5).font(.headline).padding()
    }
}

/*extension Text {
    func upper_text() -> some View {
        self.font(.body).fontWeight(.semibold).multilineTextAlignment(.center).frame(maxWidth:.infinity).background(Color(red: 0.948, green: 0.95, blue: 0.968))
    }
}*/

//change the color of the vstack to light gray
extension VStack{
    func default_color() -> some View{
        self.background(Color(red: 0.948, green: 0.95, blue: 0.968))
    }
}

extension TabView{
    func default_color() -> some View{
        self.background(Color(red: 0.948, green: 0.95, blue: 0.968))
    }
}

extension NavigationView{
    func default_color() -> some View{
        self.background(Color(red: 0.948, green: 0.95, blue: 0.968))
    }
}

extension View{
    func default_color() -> some View{
        self.background(Color(red: 0.948, green: 0.95, blue: 0.968))
    }
}
