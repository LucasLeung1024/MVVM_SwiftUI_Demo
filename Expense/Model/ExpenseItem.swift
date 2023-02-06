//
//  ExpenseItem.swift
//  Expense
//
//  Created by LFA Engineering on 30/1/2023.
//

import Foundation

struct ExpenseItem :Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var price: String
}

