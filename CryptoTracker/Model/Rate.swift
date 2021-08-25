//
//  Rate.swift
//  CryptoTracker
//
//  Created by sehio on 25.08.2021.
//

import Foundation

/*
"time": "2021-08-25T09:14:01.0000000Z",
"asset_id_base": "BTC",
"asset_id_quote": "BRL",
"rate": 252506.80987221343428281730302,
 */

class Rate: Decodable {
    let rate: Double
}
