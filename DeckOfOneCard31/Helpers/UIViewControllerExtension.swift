//
//  UIViewControllerExtension.swift
//  DeckOfOneCard31
//
//  Created by Jon Corn on 1/21/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentErrorToUser(localizedError: LocalizedError) {
        let alertController = UIAlertController(title: "Error", message: "\(localizedError)", preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
}


