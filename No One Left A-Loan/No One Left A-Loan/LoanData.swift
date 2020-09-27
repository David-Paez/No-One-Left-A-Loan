//
//  LoanData.swift
//  No One Left A-Loan
//
//  Created by Cheska S. on 9/26/20.
//

import Foundation

struct LoanData: Codable {
    var _id: String
    var type: String
    var status: String
    var credit_score: Int
    var monthly_payment: Int
    var amount: Int
    var description: String
    var creation_date: String
    var account_id: String
}
