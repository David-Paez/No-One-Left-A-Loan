//
//  ContentView.swift
//  No One Left A-Loan
//
//  Created by David Paez on 9/26/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello World")
                NavigationLink(destination: NavView()) {
                    Text("Go to TabViews")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
