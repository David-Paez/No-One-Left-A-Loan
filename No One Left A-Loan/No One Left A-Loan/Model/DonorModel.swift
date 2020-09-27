//
//  StudentModel.swift
//  No One Left A-Loan
//
//  Created by David Paez on 9/27/20.
//

import Foundation
import Combine

class DonorModel: ObservableObject {
    var id:Int
    var userName:String
    var firstName:String
    var lastName:String
    var birthDate:String
    var emailAddress: String
    var address:String
    var school:String
    var gradYear:String
    var biography:String = ""
    var lastID: Int = -1
    
    init()
    {
        self.id = 0
        self.userName = ""
        self.firstName = ""
        self.lastName = ""
        self.birthDate = ""
        self.emailAddress = ""
        self.address = ""
        self.school = ""
        self.gradYear = ""
        self.biography = ""
        self.lastID = -1
    }
    private func newId()->Int{
        lastID += 1
        return lastID
    }
}
