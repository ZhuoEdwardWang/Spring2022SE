//
//  Moments.swift
//  temp
//
//  Created by administrator-zou on 2022/4/26.
//

import SwiftUI

struct Moments: View {
    var body: some View {
        All_posts_view()
            .padding(.vertical).default_color()//.ignoresSafeArea(.container, edges:.top)
    }
}

struct Moments_Previews: PreviewProvider {
    static var previews: some View {
        Moments()
    }
}
