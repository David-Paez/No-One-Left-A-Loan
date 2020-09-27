//
//  LoginScreen.swift
//  No One Left A-Loan
//
//  Created by David Paez on 9/26/20.
//

import SwiftUI

struct LoginScreen: View {
    @ObservedObject var studentModel: StudentModel
    @ObservedObject var donorModel: DonorModel
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("Olivine"))
                    .frame(height:950)
//                Color("Olivine")
//                    .edgesIgnoringSafeArea(.all)
                LoginView(studentModel: studentModel, donorModel: donorModel)
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen(studentModel: StudentModel(), donorModel: DonorModel())
    }
}

struct LoginView: View {
    @ObservedObject var studentModel: StudentModel
    @ObservedObject var donorModel: DonorModel
    var body: some View {
        VStack {
            Image("logoforNotALoan")
                .resizable()
                .scaledToFit()
                .padding(.top,150)
                .padding(.bottom,30)
            VStack {
                HStack {
                    Text("Username")
                        .padding(.leading, 30)
                        .font(.title3)
                    Spacer()
                }
                TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color(.white))
                    .padding(.leading,30)
                    .padding(.trailing,30)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, y:-2)
                    .padding(.bottom, 30)
                HStack {
                    Text("Password")
                        .padding(.leading, 30)
                        .font(.title3)
                    Spacer()
                }
                SecureField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color(.white))
                    .padding(.leading,30)
                    .padding(.trailing,30)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, y:-2)
            }
            .padding(.bottom, 30)
            LoginButtons(studentModel: studentModel, donorModel: donorModel)
            Spacer()
        }
    }
}

struct LoginButtons: View {
    @ObservedObject var studentModel: StudentModel
    @ObservedObject var donorModel: DonorModel
    var body: some View {
        VStack {
            NavigationLink(destination: NavView()) {
                Text("Login")
                    .foregroundColor(.white)
                    .frame(width:250, height:45)
                    .background(Color("Celadon"))
                    .cornerRadius(20)
                    .padding(.bottom)
            }
            NavigationLink(destination: SignUpChoice(studentModel: studentModel,donorModel: donorModel))
            {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .frame(width:250, height:40)
                    .background(Color("Carmine"))
                    .cornerRadius(20)
            }
        }
    }
}
