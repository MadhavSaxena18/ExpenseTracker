//
//  CategoryWiseDetailsViewController.swift
//  expeneTrackerInHome
//
//  Created by Madhav Saxena on 11/01/25.
//

import UIKit

class CategoryWiseDetailsViewController: UIViewController {

    @IBOutlet weak var sanctionedAmount: UILabel!
    
    @IBOutlet weak var spentAmount: UILabel!
    
    @IBOutlet weak var remainingAmount: UILabel!
    var sanctionedAmountValue: String? //
    var remainingAmountValue: String?
    var spentAmountValue: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let value = sanctionedAmountValue {
                   sanctionedAmount.text = value
        }
        if let value = remainingAmountValue{
                   remainingAmount.text = value
               }
        if let value = spentAmountValue{
                   spentAmount.text = value
        }

        // Do any additional setup after loading the view.
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        sanctionedAmount.text = String(ExpenseDataController.shared.getSanctionAmount())
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
