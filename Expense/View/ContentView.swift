//
//  ContentView.swift
//  Expense
//
//  Created by LFA Engineering on 30/1/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isUread = true
    
    //@State private var showDetailView = false
    @EnvironmentObject var expense: Expense
    
    var body: some View {
        NavigationView {
            List(expense.expenseItems) { expenseItem in
                NavigationLink {
                    EditView(draftExpenseItem: DraftExpenseItem(expenseItem))
                } label: {
                    ExpenseItemView(expenseItem: expenseItem)
                }
                //edge:左滑还是右滑
                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                    Button{
                        print("切换未读已读")
                    }label: {
                        if isUread {
                            Label("标记为已读", systemImage: "envelope.open")
                            //Image(systemName: "envelope.open")
                        } else {
                            Label("标记为未读", systemImage: "envelope.badge")
                            //Image(systemName: "envelope.badge")
                        }
                    }
                    .tint(.blue)
                }
                .swipeActions {
                    Button(role: .destructive) {
                        expense.deleteItem(item: expenseItem)
                    } label: {
                        Label("删除账单", systemImage: "trash")
                    }
                    Button {
                        print("flag bill")
                    } label: {
                        Label("标记账单", systemImage: "flag")
                    }
                    .tint(.orange)

                }
            }
            .navigationTitle("账单")
            .toolbar {
                NavigationLink {
                    //AddView(expense: expense)
                    AddView()
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.secondary)
                }.padding(.horizontal)
            }

        }
        .navigationViewStyle(.stack)
        //        .sheet(isPresented: $showDetailView) {
        //            DetailView()
        //        }
        //        .fullScreenCover(isPresented: $showDetailView) {
        //            DetailView()
        //        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Expense())
    }
}
