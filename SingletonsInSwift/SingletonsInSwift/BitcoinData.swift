//
//  BitcoinData.swift
//  SingletonsInSwift
//
//  Created by Kelson Hartle on 1/28/21.
//

import Foundation

struct BitcoinData : Codable {
    let bpi: BPI
}

struct BPI: Codable {
    let USD: USD
}

struct USD : Codable {
    let rate_float: Double
}
