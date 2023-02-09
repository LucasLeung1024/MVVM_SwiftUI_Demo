//
//  Expense.swift
//  Expense
//
//  Created by LFA Engineering on 3/2/2023.
//

import Foundation

class Expense: ObservableObject {
    @Published
    var expenseItems = [
        ExpenseItem(name: "IOS课程", type: "教育培训", price: "800"),
        ExpenseItem(name: "MACmini", type: "数码电器", price: "15000"),
        ExpenseItem(name: "iPhone14", type: "数码电器", price: "6000")
    ]
    
    func addItem(item: ExpenseItem) {
        expenseItems.append(item)
       // objectWillChange.send()  //手动刷新
    }
    
    func deleteItem(indexSet:IndexSet) {
        expenseItems.remove(atOffsets: indexSet)
      //  objectWillChange.send()
    }
    
    func editItem(draftItem: DraftExpenseItem) {
        let index = expenseItems.firstIndex{ $0.id == draftItem.id }! //比对找到账单
        let expenseItem = ExpenseItem(name: draftItem.name, type: draftItem.type, price: draftItem.price)
        expenseItems[index] = expenseItem
       // objectWillChange.send()
    }
}
