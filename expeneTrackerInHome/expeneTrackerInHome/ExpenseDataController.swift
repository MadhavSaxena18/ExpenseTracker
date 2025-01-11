//
//  ExpenseDataController.swift
//  expeneTrackerInHome
//
//  Created by Madhav Saxena on 11/01/25.
//

import Foundation
import UIKit

class ExpenseDataController {
    private var expenses: [ExpenseTracker] = []
    
    static var shared = ExpenseDataController()
    private init() {
        lodDummyData()
        
    }
       var sbiAccount = BankAccount(bankType: .SBI , balance: 1000.0)
    var iciciAccount = BankAccount(bankType: .ICICI, balance: 2000.0)
    var bobAccount = BankAccount(bankType: .BOB, balance: 1500.0)
    
    func addExpense(expense: ExpenseTracker) {
        expenses.append(expense)
        if expense.expenseType == .food {
            expense.sanctionedAmount -= expense.spentAmount
        }else if expense.expenseType == .travel {
            expense.sanctionedAmount -= expense.spentAmount
        }else if expense.expenseType == .movie {
            expense.sanctionedAmount -= expense.spentAmount
        }else if expense.expenseType == .shopping {
            expense.sanctionedAmount -= expense.spentAmount
        }
        
    }
    func lodDummyData(){
        expenses = [ExpenseTracker(sanctionedAmount: 5000, spentAmount: 200, expenseType: .food , bankType: .SBI),
                    ExpenseTracker(sanctionedAmount: 4000, spentAmount: 200, expenseType: .travel , bankType: .SBI),
                    ExpenseTracker(sanctionedAmount: 3000, spentAmount: 200, expenseType: .movie , bankType: .SBI),
                    ExpenseTracker(sanctionedAmount: 10000, spentAmount: 200, expenseType: .shopping , bankType: .SBI)
        ]
        
    }
    
    func getAllExpense()-> [ExpenseTracker] {
        return expenses
    }
    
    func totlaExpense()-> Double {
        var sum = 0.0
        for expense in expenses {
            sum += expense.spentAmount
        }
        return sum
    }
    func totalExpensesInFood() ->  Double {
        var sum = 0.0
        
        
            for expense in expenses {
                if expense.expenseType == .food{
                    sum += expense.spentAmount
                    //expense.sanctionedAmount -= expense.spentAmount
                }
            }
        
        return sum
    }
    
    func totlaExpensesInTransportation() -> Double {
        var sum = 0.0
        for expense in expenses {
            if expense.expenseType == .travel{
                sum += expense.spentAmount
                //expense.sanctionedAmount -= expense.spentAmount
            }
        }
        return sum
    }
    
    func totalExpensesInMovie() -> Double {
        var sum = 0.0
        for expense in expenses {
            if expense.expenseType == .movie{
                sum += expense.spentAmount
                //expense.sanctionedAmount -= expense.spentAmount
            }
        }
        return sum
    }
    
    func totalExpenseInShopping() -> Double {
        var sum = 0.0
        for expense in expenses {
            if expense.expenseType == .shopping{
                sum += expense.spentAmount
                //expense.sanctionedAmount -= expense.spentAmount
            }
        }
        return sum
    }
    func getSanctionAmount()->Double{
        for expense in expenses{
            if expense.expenseType == .food{
                return expense.sanctionedAmount
            }else if expense.expenseType == .travel{
                return expense.sanctionedAmount
            }else if expense.expenseType == .movie{
                return expense.sanctionedAmount
            }else if expense.expenseType == .shopping{
                return expense.sanctionedAmount
            }
        }
        return 0
    }
    func deductAmount(amount: Double, bankType: BankType) -> Bool{
            switch bankType {
            case .SBI:
                if sbiAccount.balance >= amount {
                    sbiAccount.balance -= amount
                    return true
                }
                
            case .ICICI:
                if iciciAccount.balance >= amount {
                    iciciAccount.balance -= amount
                    return true
                }
            case .BOB:
                if bobAccount.balance >= amount {
                    bobAccount.balance -= amount
                    return true
                }
            }
        print("hellllllllo")
        return false
        }

        // Get balance for a specific bank
        func getBalance(bankType: BankType) -> Double {
            switch bankType {
            case .SBI:
                return sbiAccount.balance
            case .ICICI:
                return iciciAccount.balance
            case .BOB:
                return bobAccount.balance
            }
        }
    

}
