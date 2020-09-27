//
//  FeedView.swift
//  No One Left A-Loan
//
//  Created by Leila Adaza on 9/26/20.
//

import SwiftUI
import CoreData

struct TwitterView: View {
    var body: some View {
        NavigationView {
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
            .navigationBarTitle("#HealthyConversations", displayMode: .inline)
        }
    }
}

struct TwitterView_Previews: PreviewProvider {
    static var previews: some View {
        TwitterView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
