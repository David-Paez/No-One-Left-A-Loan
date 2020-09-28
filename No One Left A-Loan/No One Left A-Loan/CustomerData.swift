//
//  CustomerData.swift
//  No One Left A-Loan
//
//  Created by Leila Adaza on 9/27/20.
//

import Foundation

struct CustomerData: Codable {
    var _id: String
    var first_name: String
    var last_name: String
    var address: Address
}

struct Address: Codable {
    var street_number: String
    var street_name: String
    var city: String
    var state: String
    var zip: String
}
