//
//  ProfileView.swift
//  No One Left A-Loan
//
//  Created by Leila Adaza on 9/26/20.
//

import SwiftUI
import CoreData

struct ProfileView: View {
    @ObservedObject var studentModel:StudentModel
    var body: some View {
        VStack {
            Color("barGray")
                .edgesIgnoringSafeArea(.all)
                .frame(height:1)
                .overlay(Text("Profile").bold().padding(.bottom,30))
            VStack(alignment: .center, spacing: 25) {
                Image("profileIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(height:200)
                Button("Change Profile Picture") {
                }
                VStack(alignment: .center, spacing: 10) {
                    ProgressView(value: 0.25)
                        .padding(.horizontal, 20)
                        .accentColor(.blue)
                    Text("$2,500 / $10,000")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Username")
                        Text(studentModel.userName)
                            .foregroundColor(.gray)
                    }
                    NameView(studentModel: studentModel)
                    BioView(studentModel: studentModel)
                    AddressView(studentModel: studentModel)
                    SchoolView(studentModel: studentModel)
                    GradView(studentModel: studentModel)
                    Spacer()
                }
                .padding(.horizontal, 10)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(studentModel: StudentModel()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

struct NameView: View {
    @ObservedObject var studentModel: StudentModel
    var body: some View {
        HStack {
            Text("Name")
            Text(studentModel.firstName + " " + studentModel.lastName)
                .foregroundColor(.gray)
        }
    }
}

struct BioView: View {
    @ObservedObject var studentModel: StudentModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Bio")
                Text(studentModel.biography)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct AddressView: View {
    @ObservedObject var studentModel: StudentModel
    var body: some View {
        HStack {
            Text("City, State")
            Text(studentModel.address)
                .foregroundColor(.gray)
        }
    }
}

struct GradView: View {
    @ObservedObject var studentModel: StudentModel
    var body: some View {
        HStack {
            Text("Graduation Year")
            Text(studentModel.gradYear)
                .foregroundColor(.gray)
        }
    }
}

struct SchoolView: View {
    @ObservedObject var studentModel: StudentModel
    var body: some View {
        HStack {
            Text("School")
            Text(studentModel.school)
                .foregroundColor(.gray)
        }
    }
}
