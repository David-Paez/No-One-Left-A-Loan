//
//  LoanDataViewView.swift
//  No One Left A-Loan
//
//  Created by Cheska S. on 9/26/20.
//

import SwiftUI
import Foundation

struct LoanDataView: View {
    
    @State var loanDetails = [LoanData]()
    @State var allLoans: [Int] = []
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(allLoans, id: \.self) { loan in
                    Text("$\(loan)")
                }
            }
        .navigationBarBackButtonHidden(true)
        }.onAppear{
            inputAccountNumbers()
        }.navigationBarBackButtonHidden(true)
    }
    
    func inputAccountNumbers() {
        /* When given a bank/enterprise's acocunt number, would be substituted with for loop
           similar to retrieveLoan function to iterate through customer's accountIds */
        decodeJson(accountId: "5f6fce45f1bac107157e17fa")
        decodeJson(accountId: "5f700f3af1bac107157e1822")
        decodeJson(accountId: "5f701b92f1bac107157e182e")
        decodeJson(accountId: "5f701e89f1bac107157e1831")
        decodeJson(accountId: "5f70207ef1bac107157e1835")
        decodeJson(accountId: "5f702356f1bac107157e183c")
        decodeJson(accountId: "5f702395f1bac107157e183d")
        decodeJson(accountId: "5f702881f1bac107157e1841")
        
    }
    
    func decodeJson(accountId: String) {
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
                    print(loans)
                    self.loanDetails = loans
                    
                    for loan in loans {
                        self.allLoans.append(loan.amount)
                    }
                    print(self.allLoans)
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
    
struct LoanDataView_Previews: PreviewProvider {
    static var previews: some View {
        LoanDataView()
    }
}
