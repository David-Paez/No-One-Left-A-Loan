//
//  SignUpChoice.swift
//  No One Left A-Loan
//
//  Created by David Paez on 9/26/20.
//

import SwiftUI

struct SignUpChoice: View {
    @ObservedObject var studentModel: StudentModel
    @ObservedObject var donorModel: DonorModel
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Olivine"))
                .frame(height:950)
//            Color("Olivine")
//                .edgesIgnoringSafeArea(.all)
            ChoiceView(studentModel: studentModel, donorModel: donorModel)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SignUpChoice_Previews: PreviewProvider {
    static var previews: some View {
        SignUpChoice(studentModel: StudentModel(), donorModel: DonorModel())
    }
}

struct ChoiceView: View {
    @ObservedObject var studentModel: StudentModel
    @ObservedObject var donorModel: DonorModel
    var body: some View {
        VStack {
            Text("Are you a...")
                .font(.title)
                .padding(.bottom)
                .padding(.top,250)
            
            NavigationLink(destination: DonorRegistrationView(donorModel:donorModel)) {
                Text("Donor?")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width:300, height:60)
                    .background(Color("Celadon"))
                    .cornerRadius(20)
                    .padding(.bottom)
            }
            
            Text("Or")
                .font(.title)
            NavigationLink(destination: StudentRegistrationView(studentModel: studentModel)) {
                Text("Student?")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width:300, height:60)
                    .background(Color("Carmine"))
                    .cornerRadius(20)
                    .padding(.top)
            }
            
            Spacer()
            
        }
    }
}
