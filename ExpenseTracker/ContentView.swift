//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Photchara Kallayanasiri on 7/5/2567 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading , spacing: 24){
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon,.primary)
                    
                    
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
        
        
    }
}

#Preview {
    
    ContentView().environmentObject({
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = TransactionListPreviewData
        return transactionListVM
    }())
}
