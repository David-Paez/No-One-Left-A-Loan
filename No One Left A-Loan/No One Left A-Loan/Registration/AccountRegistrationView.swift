//
//  AccountRegistrationView.swift
//  No One Left A-Loan
//
//  Created by David Paez on 9/26/20.
//

import SwiftUI

struct AccountRegistrationView: View {
    @ObservedObject var studentModel: StudentModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Olivine"))
                .frame(height:950)
//            Color("Olivine")
//                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Register Account")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.top, 250)
                    .padding(.bottom, 30)
                FieldInput(fieldName: "Username", input: $studentModel.userName)
                PasswordFieldInput(fieldName: "Create Password")
                PasswordFieldInput(fieldName: "Confirm Password")
                NavigationLink(destination: NeutralView())
                {
                    Text("Post Ma-Loan!")
                        .foregroundColor(.white)
                        .frame(width:250, height:40)
                        .background(Color("Carmine"))
                        .cornerRadius(20)
                }
                Spacer()
            }
        }
    }
}

struct AccountRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        AccountRegistrationView(studentModel: StudentModel())
    }
}
