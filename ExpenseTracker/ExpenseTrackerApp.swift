//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Photchara Kallayanasiri on 7/5/2567 BE.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
