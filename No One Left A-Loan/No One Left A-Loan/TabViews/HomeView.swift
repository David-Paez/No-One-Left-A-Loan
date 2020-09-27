//
//  HomeView.swift
//  No One Left A-Loan
//
//  Created by Leila Adaza on 9/26/20.
//

import SwiftUI
import CoreData

struct HomeView: View {
    var body: some View {
        VStack{
            Color("barGray")
                .edgesIgnoringSafeArea(.all)
                .frame(height:1)
                .overlay(Text("Home").bold().padding(.bottom,30))
            List(0..<10) { loan in
                Image(systemName: "photo")
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("First Name")
                                .font(.headline)
                            Text("School")
                                .font(.subheadline)
                        }
                        Spacer()
                        Button("DONATE", action: donateFunds)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.blue)
                            .cornerRadius(50)
                    }
                    Spacer()
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .italic()
                        .lineLimit(2)
                    Spacer()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

func donateFunds() {
    print("thx big money baller :)")
}
