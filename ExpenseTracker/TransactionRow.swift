//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Photchara Kallayanasiri on 7/5/2567 BE.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    var transaction : Transaction
    
    var body: some View {
        HStack(spacing: 20,content: {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 40,height: 40)
                .overlay{
                    FontIcon.text(.awesome5Solid(code: transaction.icon),fontsize: 24,color: Color.icon)
                }
            VStack(alignment: .leading, spacing: 6, content: {
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                Text(transaction.dateParsed,format:.dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
            })
            
            Spacer()
            
            Text(transaction.signedAmount,format: .currency(code: "USD"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.text : .primary)
        })
        .padding([.top,.bottom],8)
    }
}

#Preview {
    TransactionRow(transaction: transactionPreviewData)
}
