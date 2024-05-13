//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Photchara Kallayanasiri on 13/5/2567 BE.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            List(content: {
                ForEach(Array(transactionListVM.groupTransactionsByMonth()),id: \.key){
                    month,transactions in
                    
                    Section {
                        VStack{
                            ForEach(transactions){
                                transaction in
                                TransactionRow(transaction: transaction)
                                Divider()
                            }
                        }
                    }
                    header: {
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                    .listRowSeparator(.hidden)

                }
            })
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView(content: {
        TransactionList().environmentObject({
            let transactionListVM = TransactionListViewModel()
            transactionListVM.transactions = TransactionListPreviewData
            return transactionListVM
        }())
    })
}
