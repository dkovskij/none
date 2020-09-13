//
//  BasketResponseModel.swift
//  none
//
//  Created by  d_b on 03.09.2020.
//  Copyright © 2020  d_b. All rights reserved.
//

import Foundation

struct BasketResponseModel: Codable {
    var items: [BasketItemModel]?
    var additional: [BasketItemModel]
    struct prices: Codable {
        var total: Total
        var sum: Sum
        var discount_card: DiscountCard
        var discount_promo: DiscountPromo
        var user_price: UserPrice
        var price: BasketResponsePrice
        var discount: BasketResponseDiscount
        
        struct Total: Codable {
            var currency: String
            var value: Int
            var formatted: String
        }

        struct Sum: Codable {
            var currency: String
            var value: Int
            var formatted: String
            var percent: Int
        }

        struct DiscountCard: Codable {
            var currency: String
            var value: Int
            var formatted: String
            var percent: Int
        }

        struct DiscountPromo: Codable {
            var currency: String
            var value: Int
            var formatted: String
            var percent: Int
        }

        struct UserPrice: Codable {
            var currency: String
            var value: Int
            var formatted: String
        }

        struct BasketResponsePrice: Codable {
            var value: Int
            var formatted: String
        }

        struct BasketResponseDiscount: Codable {
            var value: Int
            var formatted: String
        }
    }
}
