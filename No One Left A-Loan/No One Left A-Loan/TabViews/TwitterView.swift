//
//  FeedView.swift
//  No One Left A-Loan
//
//  Created by Leila Adaza on 9/26/20.
//

import SwiftUI
import CoreData

struct TwitterView: View {
//    let myTwitterAPI = TwitterAPI()
    var body: some View {
        VStack {
            Color("barGray")
                .edgesIgnoringSafeArea(.all)
                .frame(height:1)
                .overlay(Text("#HealthyConversations").bold().padding(.bottom,30))
            List(0..<10) { tweet in
                Image(systemName: "photo")
                VStack(alignment: .leading) {
                    Text("Name @username")
                        .font(.body)
                    Spacer()
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
        }
    }
}

struct TwitterView_Previews: PreviewProvider {
    static var previews: some View {
        TwitterView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
