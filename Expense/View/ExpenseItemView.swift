//
//  ExpenseItemView.swift
//  Expense
//
//  Created by Lucas on 15/2/2023.
//

import SwiftUI

struct ExpenseItemView: View {
    var expenseItem : ExpenseItem
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(expenseItem.name).font(.headline)
                Text(expenseItem.type)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(expenseItem.price)
        }
    }
}

