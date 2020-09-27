//
//  StudentRegistrationView.swift
//  No One Left A-Loan
//
//  Created by David Paez on 9/26/20.
//

import SwiftUI

struct StudentRegistrationView: View {
    @State var bioField: String
    var body: some View {
        VStack {
            StudentFormView(bioField: $bioField)
            NavigationLink(destination: AccountRegistrationView())
            {
                Text("Continue")
                    .foregroundColor(.white)
                    .frame(width:150, height:40)
                    .background(Color("Carmine"))
                    .cornerRadius(20)
            }
        }
    }
}

struct StudentRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        StudentRegistrationView(bioField: "Enter bio")
    }
}

struct FieldInput: View {
    var fieldName: String
    var body: some View {
        VStack {
            HStack {
                Text(fieldName)
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
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
        }
    }
}

struct PasswordFieldInput: View {
    var fieldName: String
    var body: some View {
        VStack {
            HStack {
                Text(fieldName)
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
                .padding(.bottom, 30)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
        }
    }
}


struct BioField: View {
    @Binding var bioField: String
    var body: some View {
        VStack {
            HStack {
                Text("Biography")
                    .padding(.leading, 30)
                    .font(.title3)
                Text("(130 characters max)")
                    .font(.system(size: 13))
                    .fontWeight(.bold)
                Spacer()
            }
            ZStack
            {
                TextEditor(text: $bioField)
                    .background(Color(.white))
                    .padding(.leading,30)
                    .padding(.trailing,30)
                    .padding(.bottom, 30)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, y:-2)
                    .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                        bioField = ""
                    })
            }
        }
    }
}

struct StudentFormView: View {
    @Binding var bioField: String
    var body: some View {
        VStack {
            Spacer()
            List {
                VStack {
                    FieldInput(fieldName: "First Name")
                    FieldInput(fieldName: "Last Name")
                    FieldInput(fieldName: "Address")
                    FieldInput(fieldName: "City")
                    FieldInput(fieldName: "State")
                    FieldInput(fieldName: "Zip Code")
                    FieldInput(fieldName: "School")
                    FieldInput(fieldName: "Graduation Year")
                    BioField(bioField: $bioField)
                }
                .background(Color("Olivine"))
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}
