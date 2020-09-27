//
//  ProfileView.swift
//  No One Left A-Loan
//
//  Created by Leila Adaza on 9/26/20.
//

import SwiftUI
import CoreData

struct ProfileView: View {
    var body: some View {
        VStack {
            Color("barGray")
                .edgesIgnoringSafeArea(.all)
                .frame(height:1)
                .overlay(Text("Profile").bold().padding(.bottom,30))
            VStack(alignment: .center, spacing: 25) {
                Image(systemName: "photo")
                    .resizable()
                    .padding([.top, .leading, .trailing], 20)
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
                    NameView()
                    BioView()
                    AddressView()
                    SchoolView()
                    GradView()
                    Spacer()
                }
                .padding(.horizontal, 10)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

struct NameView: View {
    var body: some View {
        HStack {
            Text("Name")
            Text("Disguised Toast")
                .foregroundColor(.gray)
        }
    }
}

struct BioView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Bio")
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct AddressView: View {
    var body: some View {
        HStack {
            Text("City, State")
            Text("Los Angeles, CA")
                .foregroundColor(.gray)
        }
    }
}

struct GradView: View {
    var body: some View {
        HStack {
            Text("Graduation Year")
            Text("2021")
                .foregroundColor(.gray)
        }
    }
}

struct SchoolView: View {
    var body: some View {
        HStack {
            Text("School")
            Text("Florida International University")
                .foregroundColor(.gray)
        }
    }
}
