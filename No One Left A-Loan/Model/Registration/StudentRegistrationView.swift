//
//  StudentRegistrationView.swift
//  No One Left A-Loan
//
//  Created by David Paez on 9/26/20.
//

import SwiftUI

struct StudentRegistrationView: View {
    @ObservedObject var studentModel: StudentModel
    
    var body: some View {
        ZStack {
            Rectangle()
//                .foregroundColor(Color("Olivine"))
//                .frame(height:920)
            Color("Olivine")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Student Registration Form")
                    .font(.title)
                    .bold()
//                    .padding(.top,100)
                StudentFormView(studentModel: studentModel)
                NavigationLink(destination: AccountRegistrationView(studentModel: studentModel))
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

struct StudentRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        StudentRegistrationView(studentModel: StudentModel())
    }
}

struct FieldInput: View {
    var fieldName: String
    @Binding var input: String
    var body: some View {
        VStack {
            HStack {
                Text(fieldName)
                    .padding(.leading, 30)
                    .font(.title3)
                Spacer()
            }
            TextField("", text: $input)
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


struct EmailFieldInput: View {
    var fieldName: String
    @Binding var input: String
    var body: some View {
        VStack {
            HStack {
                Text(fieldName)
                    .padding(.leading, 30)
                    .font(.title3)
                Spacer()
            }
            TextField("", text: $input)
                .keyboardType(.emailAddress)
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
    @Binding var input: String
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
                TextEditor(text: $input)
                    .background(Color(.white))
                    .padding(.leading,30)
                    .padding(.trailing,30)
                    .padding(.bottom, 30)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, y:-2)
                    .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                        input = ""
                    })
            }
        }
    }
}

struct StudentFormView: View {
    @ObservedObject var studentModel: StudentModel
    var body: some View {
        VStack {
            Spacer()
            List {
                VStack {
                    FieldInput(fieldName: "First Name", input: $studentModel.firstName)
                    FieldInput(fieldName: "Last Name", input: $studentModel.lastName)
                    FieldInput(fieldName: "Birth Date", input: $studentModel.birthDate)
                    EmailFieldInput(fieldName: "Email", input: $studentModel.emailAddress)
                    FieldInput(fieldName: "Address (Street, City, State, Zip)", input: $studentModel.address)
                    FieldInput(fieldName: "School", input: $studentModel.school)
                    FieldInput(fieldName: "Graduation Year", input: $studentModel.gradYear)
                    BioField(input: $studentModel.biography)
                }
                .listRowBackground(Color("Olivine"))            }
            Spacer()
        }
    }
}
