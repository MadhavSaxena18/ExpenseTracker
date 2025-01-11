//
//  Expense.swift
//  expeneTrackerInHome
//
//  Created by Madhav Saxena on 11/01/25.
//

import Foundation

enum Expense: Int{
    case food
    case travel
    case movie
    case shopping
}

enum BankType: Int{
    case SBI
    case ICICI
    case BOB
}

class ExpenseTracker{
    var sanctionedAmount: Double
    var spentAmount: Double
    var expenseType: Expense
    var bankType: BankType
    
    
    static var shared2 = ExpenseTracker(sanctionedAmount: 1000000, spentAmount: 500000, expenseType: .food, bankType: .SBI)
    init(sanctionedAmount: Double = 0.0, spentAmount: Double, expenseType: Expense, bankType: BankType) {
        self.sanctionedAmount = sanctionedAmount
        self.spentAmount = spentAmount
        self.expenseType = expenseType
        self.bankType = bankType
    }
}
    class BankAccount {
        var bankType: BankType
        var balance: Double

        init(bankType: BankType, balance: Double) {
            self.bankType = bankType
            self.balance = balance
            
        }
}
