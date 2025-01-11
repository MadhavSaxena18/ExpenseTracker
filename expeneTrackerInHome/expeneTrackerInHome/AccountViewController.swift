//
//  AccountViewController.swift
//  expeneTrackerInHome
//
//  Created by Madhav Saxena on 11/01/25.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var sbiBalanceLabel: UILabel!
    
    @IBOutlet weak var iciciBalanceLabel: UILabel!
    
    @IBOutlet weak var bobBalanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sbiBalanceLabel.text = String(ExpenseDataController.shared.getBalance(bankType: .SBI))
        
        iciciBalanceLabel.text = String(ExpenseDataController.shared.getBalance(bankType: .ICICI))
        bobBalanceLabel.text = String(ExpenseDataController.shared.getBalance(bankType: .BOB))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
