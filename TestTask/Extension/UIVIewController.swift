//
//  UIVIewController.swift
//  TestTask
//
//  Created by Максим Кузнецов on 31.03.2022.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardOnBackgroundTouched() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
