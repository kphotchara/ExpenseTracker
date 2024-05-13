//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Photchara Kallayanasiri on 13/5/2567 BE.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM : TransactionListViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                NavigationLink {
                    TransactionList()
                } label: {
                    HStack(spacing: 4, content: {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    })
                    .foregroundColor(Color.text)
                }

            }
            .padding(.top)
            
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()),id : \.element){
                index,transaction in
                TransactionRow(transaction: transaction)
                Divider()
                    .opacity(index ==  transactionListVM.transactions.prefix(5).endIndex - 1 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20,style: .continuous))
        .shadow(color:Color.primary.opacity(0.2),radius: 10,x: 0,y: 5)
    }
}



#Preview {
    RecentTransactionList()
            .environmentObject({
                let transactionListVM = TransactionListViewModel()
                transactionListVM.transactions = TransactionListPreviewData
                return transactionListVM
            }())
    
}
