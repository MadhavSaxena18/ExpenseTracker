//
//  AddExpenseViewController.swift
//  expeneTrackerInHome
//
//  Created by Madhav Saxena on 11/01/25.
//

import UIKit

class AddExpenseViewController: UIViewController {
   
    @IBOutlet weak var expenseTypeSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    
    @IBOutlet weak var bankTypeSegmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
        
        
        @IBAction func addButton(_ sender: UIButton) {
            let expenseCategory: [Expense] = [.food, .travel , .movie, .shopping]
            let selectedExpenseCategory = expenseCategory[expenseTypeSegmentedControl.selectedSegmentIndex]
            
            
            guard let amountText = amountTextField.text , let amount = Double(amountText) else { return }
            
            
            
            let bankCategory: [BankType] = [.SBI, .ICICI, .BOB]
            let selectedBankCategory = bankCategory[bankTypeSegmentedControl.selectedSegmentIndex]
            
            let expenseTrack = ExpenseTracker(spentAmount: amount, expenseType: selectedExpenseCategory, bankType: selectedBankCategory)
            
            if !ExpenseDataController.shared.deductAmount(amount: amount, bankType: selectedBankCategory) {
                showAlert(message: "Insufficient Balance")
                return
            }
            
            ExpenseDataController.shared.addExpense(expense: expenseTrack)
            
            print("unwind")
            
            performSegue(withIdentifier: "unwindToMain", sender: self)
            
            
        }
    
    private func showAlert(message: String) {
           let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(alert, animated: true, completion: nil)
       }
}
