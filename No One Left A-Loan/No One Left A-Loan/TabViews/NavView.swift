//
//  NavView.swift
//  No One Left A-Loan
//
//  Created by Leila Adaza on 9/26/20.
//

import SwiftUI
import CoreData

struct NavView: View {
    @ObservedObject var studentModel:StudentModel
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            TwitterView()
                .tabItem {
                    Image(systemName: "bubble.left.fill")
                    Text("#HealthyConversations")
                }
            ProfileView(studentModel: studentModel)
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView(studentModel: StudentModel()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
