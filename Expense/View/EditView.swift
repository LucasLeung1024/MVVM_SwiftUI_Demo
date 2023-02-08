//
//  EditView.swift
//  Expense
//
//  Created by LFA Engineering on 8/2/2023.
//

import SwiftUI

struct EditView: View {
    //private属性
    private let types = ["日用百货", "餐饮美食", "数码电器", "教育培训", "充值缴费"]
    
    @Environment(\.dismiss) var dismiss
    
    //可以被传过来的数据
    @ObservedObject var expense: Expense
    var expenseItem: ExpenseItem
    
    //计算属性
    var expenseItemIndex: Int {
        //循环数组，比对ID来找出index
        expense.expenseItems.firstIndex { $0.id == self.expenseItem.id}!
    }
    
    var body: some View {
        // NavigationView {
             Form {
                 Section("账单名") {
                     TextField("收入或支出来源", text: $expense.expenseItems[expenseItemIndex].name)
                 }
                 Section("账单分类") {
                     Picker("选择一个分类", selection: $expense.expenseItems[expenseItemIndex].type) {
                         ForEach(types, id: \.self) {
                             Text($0)
                         }
                     }
                 }
                 Section("账单金额") {
                     TextField("收入或支出多少", text: $expense.expenseItems[expenseItemIndex].price)
                         .keyboardType(.numberPad)
                 }
             }
             .navigationBarTitleDisplayMode(.inline)
             .navigationTitle("编辑账单")
             .navigationBarBackButtonHidden(true)
             .toolbar {
                 ToolbarItem(placement: .navigationBarLeading) {
                     Button {
                         dismiss()
                     } label: {
                         Image(systemName: "arrow.left").foregroundColor(.primary)
                     }
                     
                 }
                 ToolbarItem(placement: .navigationBarTrailing) {
                     Button {
                         expense.editItem()
                         dismiss()
                     } label: {
                         Text("保存").foregroundColor(.primary)
                             .padding(.horizontal)
                     }
                 }
             }
    }
    
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(expense: Expense(), expenseItem: ExpenseItem(name: "test", type: "test", price: "100"))
    }
}
