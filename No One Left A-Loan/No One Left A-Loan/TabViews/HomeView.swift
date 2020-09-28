//
//  HomeView.swift
//  No One Left A-Loan
//
//  Created by Leila Adaza on 9/26/20.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @State var loanDetails = [LoanData]()
    @State var allLoans: [Int] = []
    @State var customerDetails = [CustomerData]()
    @State var allNames: [String] = []
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
//                Color("barGray")
//                    .edgesIgnoringSafeArea(.all)
//                    .frame(height:1)
//                    .overlay(Text("Home").bold().padding(.vertical, 30))
                List {
                    ForEach(Array(zip(allNames, allLoans)), id: \.0) { customer in
                        HStack {
//                            Image(systemName: "photo")
                            VStack(alignment: .leading) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("\(customer.0)")
                                            .font(.headline)
                                        Text("Florida International University")
                                            .font(.subheadline)
                                        Text("$\(customer.1)")
                                            .font(.subheadline)
                                    }
                                    Spacer()
                                    Button("DONATE", action: donateFunds)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(8)
                                        .background(Color("Celadon"))
                                        .cornerRadius(50)
                                }
                                Spacer()
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .italic()
                                    .lineLimit(2)
                                    .frame(height: 50.0)
                                Spacer()
                            }
                        }
//                        .listRowInsets(EdgeInsets())
                    }
                }
            }
            .navigationBarTitle("Home", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .onAppear{
                inputAccountNumbers()
                getCustomers()
            }
        }
    }
    
    func inputAccountNumbers() {
        /* When given a bank/enterprise's acocunt number, would be substituted with for loop
           similar to retrieveLoan function to iterate through customer's accountIds */
        getLoanFor(accountId: "5f6fce45f1bac107157e17fa")
        getLoanFor(accountId: "5f700f3af1bac107157e1822")
        getLoanFor(accountId: "5f701b92f1bac107157e182e")
        getLoanFor(accountId: "5f701e89f1bac107157e1831")
        getLoanFor(accountId: "5f70207ef1bac107157e1835")
        getLoanFor(accountId: "5f702356f1bac107157e183c")
        getLoanFor(accountId: "5f702395f1bac107157e183d")
        getLoanFor(accountId: "5f702881f1bac107157e1841")
    }
    
    func getLoanFor(accountId: String) {
        let semaphore = DispatchSemaphore (value: 0)
        var request = URLRequest(url: URL(string: "http://api.reimaginebanking.com/accounts/\(accountId)/loans?key=d5e35f4bb7306734cc3bd0f9f704ebc1")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let loans = try decoder.decode([LoanData].self, from: data)
                    
                    self.loanDetails = loans
                    
                    for loan in loans {
                        self.allLoans.append(loan.amount)
                    }
                } catch {
                    print(error)
                }
              semaphore.signal()
            }
        }
        task.resume()
        semaphore.wait()
    }
    
    func getCustomers() {
        let semaphore = DispatchSemaphore (value: 0)
        var request = URLRequest(url: URL(string: "http://api.reimaginebanking.com/customers?key=d5e35f4bb7306734cc3bd0f9f704ebc1")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let customers = try decoder.decode([CustomerData].self, from: data)
                    
                    self.customerDetails = customers
                    
                    for customer in customers {
                        self.allNames.append(customer.first_name)
                    }
                } catch {
                    print(error)
                }
              semaphore.signal()
            }
        }
        task.resume()
        semaphore.wait()
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
