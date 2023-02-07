//
//  DetailView.swift
//  Expense
//
//  Created by LFA Engineering on 30/1/2023.
//

import SwiftUI

struct DetailView: View {
    
    //private属性
    private let types = ["日用百货", "餐饮美食", "数码电器", "教育培训", "充值缴费"]
    
    @State private var name = ""
    @State private var type = ""
    @State private var price = ""
    @Environment(\.dismiss) var dismiss
    
    //可以被传过来的数据
    @ObservedObject var expense: Expense
    var expenseItem: ExpenseItem?
    
    //计算属性
    var isAddingPage: Bool {expenseItem == nil} //是否是新增
    var expenseItemIndex: Int? {
        //循环数组，比对ID来找出index
        expense.expenseItems.firstIndex { $0.id == self.expenseItem?.id}
    }
    
    var body: some View {
        
       // NavigationView {
            Form {
                Section("账单名") {
                    TextField("收入或支出来源", text: isAddingPage ? $name : $expense.expenseItems[expenseItemIndex!].name)
                }
                Section("账单分类") {
                    Picker("选择一个分类", selection: isAddingPage ? $type : $expense.expenseItems[expenseItemIndex!].type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section("账单金额") {
                    TextField("收入或支出多少", text: isAddingPage ? $price : $expense.expenseItems[expenseItemIndex!].price)
                        .keyboardType(.numberPad)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(isAddingPage ? "添加账单" : "编辑账单")
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
                        if isAddingPage {
                            expense.addItem(item: ExpenseItem(name: name, type: type, price: price))
                        } else {
                            //TODO edit
                        }
                        dismiss()
                    } label: {
                        Text("保存").foregroundColor(.primary)
                            .padding(.horizontal)
                    }
                }
            }
      //  }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(expense: Expense(), expenseItem: ExpenseItem(name: "IOS课程", type: "教育培训", price: "800"))
    }
}
