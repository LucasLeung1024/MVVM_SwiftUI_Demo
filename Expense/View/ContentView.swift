//
//  ContentView.swift
//  Expense
//
//  Created by LFA Engineering on 30/1/2023.
//

import SwiftUI

struct ContentView: View {
    
    //@State private var showDetailView = false
    
    @StateObject var expense = Expense()
     
    var body: some View {
        NavigationView {
            List(expense.expenseItems) { expenseItem in
                NavigationLink {
                    //DetailView()
                } label: {
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
            .navigationTitle("账单")
            .toolbar {
                NavigationLink {
                    DetailView(expense: expense)
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
    }
}