//
//  ContentView.swift
//  No One Left A-Loan
//
//  Created by David Paez on 9/26/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var studentModel: StudentModel
    @ObservedObject var donorModel: DonorModel

    var body: some View {
        LoginScreen(studentModel: studentModel, donorModel: donorModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(studentModel:StudentModel(), donorModel:DonorModel()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
