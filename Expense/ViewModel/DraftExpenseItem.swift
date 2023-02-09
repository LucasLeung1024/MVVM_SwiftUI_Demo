//
//  DraftExpenseItem.swift
//  Expense
//
//  Created by LFA Engineering on 8/2/2023.
//

import Foundation

class DraftExpenseItem: ObservableObject {
    @Published var id = UUID()
    @Published var name: String
    @Published var type: String
    @Published var price: String
    
    init(_ enpenseItem: ExpenseItem) {
        id = enpenseItem.id
        name = enpenseItem.name
        type = enpenseItem.type
        price = enpenseItem.price
    }
}
