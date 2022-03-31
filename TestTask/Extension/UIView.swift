//
//  UIView.swift
//  TestTask
//
//  Created by Максим Кузнецов on 31.03.2022.
//

import UIKit

extension UIView {
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        gradient.cornerRadius = 10
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}
