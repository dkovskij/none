//
//  BasketItem.swift
//  none
//
//  Created by  d_b on 30.08.2020.
//  Copyright © 2020  d_b. All rights reserved.
//

import SwiftUI
import URLImage

struct BasketItemView: View {
    var item: BasketItemModel
    var url: URL
    
    var body: some View {
        HStack {
            VStack {
                URLImage(url) { proxy in
                    proxy.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                }
                .frame(width: 100.0, height: 100.0)
            }
            VStack {
                VStack {
                    Text(item.brand)
                        .font(.custom("OpenSans", size: 14))
                        .fontWeight(.semibold)
                        .frame(width: 200, height: 24, alignment: .leading)
                }
                VStack {
                    Text(item.name)
                        .font(.custom("OpenSans", size: 12))
                        //                    .offset(y: 5)
                        .frame(width: 200, height: 72, alignment: .leading)
                }
            }
            VStack {
                Button(action: {
                    print("Edit button was tapped")
                }, label: {
                    Image("close")
                }).frame(width: 15, height: 15)
            }
        }
    }
}

struct BasketItemView_Previews: PreviewProvider {
    static var previews: some View {
        BasketItemView(item: data.jsonData[1], url: URL(string: data.jsonData[1].image)!)
        
    }
}
