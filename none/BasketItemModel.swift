//
//  BasketItem.swift
//  none
//
//  Created by  d_b on 26.08.2020.
//  Copyright © 2020  d_b. All rights reserved.
//

import SwiftUI
import CoreLocation

struct BasketItemModel: Codable, Identifiable {
    var name: String
    var brand: String
    var id: String
    var product_id: String
    var image: String
    var link: String
    var qty: Int!
    // может qty: Double?
    var parent_id: Int
    var barcode: String
    var sizes: [Sizes]
    var prices: Prices
    
    struct Sizes: Codable {
        var barcode: Int
        var label: Int
        var value: Int
        var selected: Bool
    }
    struct Prices: Codable {
        fileprivate var discount_price: DiscountPrice
        fileprivate var old_price: OldPrice
        fileprivate var price: Price
    }
    
//    var category: Category

//    enum Category: String, CaseIterable, Codable, Hashable {
//        case featured = "Featured"
//        case lakes = "Lakes"
//        case rivers = "Rivers"
//    }
}

struct DiscountPrice: Hashable, Codable {
    var currency: String
    var value: Double
    var formatted: String
    var percent: Double
}

struct OldPrice: Hashable, Codable {
    var currency: String
    var value: String
    var formatted: String
}

struct Price: Hashable, Codable {
    var currency: String
    var value: String
    var formatted: String
}
