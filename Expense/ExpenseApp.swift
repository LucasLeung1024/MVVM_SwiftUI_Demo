//
//  ExpenseApp.swift
//  Expense
//
//  Created by LFA Engineering on 30/1/2023.
//

import SwiftUI

@main
struct ExpenseApp: App {
    @StateObject var expense = Expense()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(expense)
        }
    }
}
