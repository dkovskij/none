//
//  Basket.swift
//  none
//
//  Created by  d_b on 26.08.2020.
//  Copyright © 2020  d_b. All rights reserved.
//

import SwiftUI

struct Basket: View {
//    var data: Any = getData()
    
    var body: some View {
        VStack {
         Text("КОРЗИНА")
            .font(.custom("OpenSans", size: 16))
            .fontWeight(.semibold)
            
            Text("3 товара на сумму хардкод")
                .font(.custom("OpenSans", size: 14))
                .foregroundColor(Color(red: 0.599, green: 0.599, blue: 0.599))
                .offset(y: 5)
            
            BasketList()
                .padding(.top, 10.0)
            
            Spacer()
        }
    }
}

struct Basket_Previews: PreviewProvider {
    static var previews: some View {
        Basket()
    }
}
