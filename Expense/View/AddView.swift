//
//  AddView.swift
//  Expense
//
//  Created by LFA Engineering on 8/2/2023.
//

import SwiftUI

struct AddView: View {
    
    //private属性
    private let types = ["日用百货", "餐饮美食", "数码电器", "教育培训", "充值缴费"]
    
    @State private var name = ""
    @State private var type = ""
    @State private var price = ""
    @Environment(\.dismiss) var dismiss
    
    //可以被传过来的数据
    @ObservedObject var expense: Expense
    
    var body: some View {
        // NavigationView {
        Form {
            Section("账单名") {
                TextField("收入或支出来源", text: $name)
            }
            Section("账单分类") {
                Picker("选择一个分类", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
            }
            Section("账单金额") {
                TextField("收入或支出多少", text: $price)
                    .keyboardType(.numberPad)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("添加账单")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left").foregroundColor(.primary)
                }
                .padding(.horizontal)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    expense.addItem(item: ExpenseItem(name: name, type: type, price: price))
                    dismiss()
                } label: {
                    Text("保存").foregroundColor(.primary)
                        .padding(.horizontal)
                }
            }
        }
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expense: Expense())
    }
}
