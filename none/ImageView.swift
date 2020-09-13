//
//  ImageView.swift
//  none
//
//  Created by  d_b on 26.08.2020.
//  Copyright © 2020  d_b. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    var image: Image
    
    var body: some View {
        image
            .frame(width: 200.0, height: 200.0)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 1))
        .shadow(radius: 10)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: Image("turtlerock"))
    }
}
