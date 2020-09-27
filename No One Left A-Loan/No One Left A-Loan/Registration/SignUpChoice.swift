//
//  SignUpChoice.swift
//  No One Left A-Loan
//
//  Created by David Paez on 9/26/20.
//

import SwiftUI

struct SignUpChoice: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Olivine"))
                .frame(height:1000)
            ChoiceView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SignUpChoice_Previews: PreviewProvider {
    static var previews: some View {
        SignUpChoice()
    }
}

struct ChoiceView: View {
    var body: some View {
        VStack {
            Text("Are you a...")
                .font(.title)
                .padding(.bottom)
                .padding(.top,280)
            
            Text("Donor?")
                .font(.title)
                .foregroundColor(.white)
                .frame(width:300, height:60)
                .background(Color("Celadon"))
                .cornerRadius(20)
                .padding(.bottom)
            
            Text("Or")
                .font(.title)
            
            NavigationLink(destination: StudentRegistrationView(bioField: "Enter bio")) {
                Text("Student?")
                    .font(.title)
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
