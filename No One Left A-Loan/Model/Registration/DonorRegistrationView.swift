//
//  DonorRegistrationView.swift
//  No One Left A-Loan
//
//  Created by David Paez on 9/26/20.
//

import SwiftUI

struct DonorRegistrationView: View {
    @ObservedObject var donorModel: DonorModel
    
    var body: some View {
        ZStack {
            Rectangle()
//                .foregroundColor(Color("Olivine"))
//                .frame(height:920)
            Color("Olivine")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Donor Registration Form")
                    .font(.title)
                    .bold()
                
                DonorFormView(donorModel:donorModel)
                NavigationLink(destination: NeutralView())
                {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(width:150, height:40)
                        .background(Color("Carmine"))
                        .cornerRadius(20)
                        .padding(.bottom, 10)
                }
            }
        }
    }
}

struct DonorRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        DonorRegistrationView(donorModel: DonorModel())
    }
}

struct DonorFormView: View {
    @ObservedObject var donorModel: DonorModel
    var body: some View {
        VStack {
            Spacer()
            List {
                VStack {
                    FieldInput(fieldName: "First Name", input: $donorModel.firstName)
                    FieldInput(fieldName: "Last Name", input: $donorModel.lastName)
                    FieldInput(fieldName: "Birth Date", input: $donorModel.birthDate)
                    EmailFieldInput(fieldName: "Email", input: $donorModel.emailAddress)
                    FieldInput(fieldName: "Address (Street, City, State, Zip)", input: $donorModel.address)
                    BioField(input: $donorModel.biography)
                }
                .listRowBackground(Color("Olivine"))
            }
            Spacer()
        }
    }
}
