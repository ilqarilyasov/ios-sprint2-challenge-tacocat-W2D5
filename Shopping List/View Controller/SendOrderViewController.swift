//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by Ilgar Ilyasov on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {
    
    // MARK: - Properties
    var item: ShoppingItem?
    var shoppingItemController: ShoppingItemController?
    let notificationHelper = NotificationHelper()

    // MARK: - Outlets
    
    @IBOutlet weak var shoppingInfoLabel: UILabel!
    @IBOutlet weak var customerNameTextField: UITextField!
    @IBOutlet weak var customerAddressTextField: UITextField!
    
    // MARK: - App life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func sendOrderButtonTapped(_ sender: Any) {
        guard let name = customerNameTextField.text,
              let address = customerAddressTextField.text else { return }
        
        notificationHelper.getAuthorizationStatus { (status) in
            if status == .authorized {
                self.notificationHelper.scheduleNotification(customerName: name, customerAddress: address)
            } else {
                self.notificationHelper.requestAuthorization()
            }
        }
    }

}
