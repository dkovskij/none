//
//  BasketList.swift
//  none
//
//  Created by  d_b on 26.08.2020.
//  Copyright © 2020  d_b. All rights reserved.
//

import SwiftUI

struct BasketList: View {
//    @EnvironmentObject var myData: myData
    @EnvironmentObject var getData: datas
    
    var body: some View {
        List(getData.jsonData) { item in
                BasketItemView(item: item, url: URL(string: item.image)!)
            }
//        Text(item.name)
//            List(basketData) { item in
//                    BasketItem(item: BasketItem)
//            }
    }
}

struct BasketList_Previews: PreviewProvider {    
    static var previews: some View {
        BasketList().environmentObject(datas())
    }
}
