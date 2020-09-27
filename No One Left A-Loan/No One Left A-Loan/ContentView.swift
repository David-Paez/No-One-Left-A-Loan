//
//  ContentView.swift
//  No One Left A-Loan
//
//  Created by David Paez on 9/26/20.
//

import SwiftUI
import CoreData
import Alamofire

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Hello World")
                NavigationLink(destination: NavView()) {
                    Text("Go to TabViews")
                }
                Button("Click Me", action: basicRequest)
            }
        }
    }
}

func basicRequest() {
    AF.request("https://httpbin.org/get").response { response in
        debugPrint(response)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
