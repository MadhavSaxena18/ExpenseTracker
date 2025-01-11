//
//  ViewController.swift
//  expeneTrackerInHome
//
//  Created by Madhav Saxena on 11/01/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var foodSpentmount : UILabel!
    @IBOutlet var travelSpentmount : UILabel!
    @IBOutlet var movieSpentmount : UILabel!
    @IBOutlet var shoppingSpentmount : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let foodSpent = ExpenseDataController.shared.totalExpensesInFood()
        let travelSpent = ExpenseDataController.shared.totlaExpensesInTransportation()
        let movieSpent = ExpenseDataController.shared.totalExpensesInMovie()
        let shoppingSpent = ExpenseDataController.shared.totalExpenseInShopping()
        
        foodSpentmount.text = String(foodSpent)
        travelSpentmount.text = String(travelSpent)
        movieSpentmount.text = String(movieSpent)
        shoppingSpentmount.text = String(shoppingSpent)
        
        
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let expenses = ExpenseDataController.shared.getSanctionAmount()
        //ExpenseDataController.shared.
        if segue.identifier == "foodCat"{
            if let destinationVC = segue.destination as? CategoryWiseDetailsViewController{
                
                destinationVC.sanctionedAmountValue = String(ExpenseDataController.shared.getSanctionAmount())
                
                destinationVC.spentAmountValue = String(ExpenseDataController.shared.totalExpensesInFood())
                destinationVC.remainingAmountValue = String(ExpenseDataController.shared.getSanctionAmount() - ExpenseDataController.shared.totalExpensesInFood())
                
            }
        }else if segue.identifier == "travelCat"{
            if let destinationVC = segue.destination as? CategoryWiseDetailsViewController{
                
                destinationVC.sanctionedAmountValue = String(ExpenseDataController.shared.getSanctionAmount())
                
                destinationVC.spentAmountValue = String(ExpenseDataController.shared.totlaExpensesInTransportation())
                destinationVC.remainingAmountValue = String(ExpenseDataController.shared.getSanctionAmount() - ExpenseDataController.shared.totlaExpensesInTransportation())
            }
        }else if segue.identifier == "movieCat"{
            if let destinationVC = segue.destination as? CategoryWiseDetailsViewController{
                
                destinationVC.sanctionedAmountValue = String(ExpenseDataController.shared.getSanctionAmount())
                
                destinationVC.spentAmountValue = String(ExpenseDataController.shared.totalExpensesInMovie())
                destinationVC.remainingAmountValue = String(ExpenseDataController.shared.getSanctionAmount() - ExpenseDataController.shared.totalExpensesInMovie())
            }
            
        }
        else if segue.identifier == "shoppingCat"{
            if let destinationVC = segue.destination as? CategoryWiseDetailsViewController{
                
                destinationVC.sanctionedAmountValue = String(ExpenseDataController.shared.getSanctionAmount())
                
                destinationVC.spentAmountValue = String(ExpenseDataController.shared.totalExpenseInShopping())
                destinationVC.remainingAmountValue = String(ExpenseDataController.shared.getSanctionAmount() - ExpenseDataController.shared.totalExpenseInShopping())
            }
        }
    }
    
    @IBAction func unwindToViewcontroller(segue: UIStoryboardSegue){
        viewWillAppear(true)
    }
            
}

