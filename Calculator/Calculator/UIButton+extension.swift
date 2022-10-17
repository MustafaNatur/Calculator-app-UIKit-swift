//
//  UIButton+extension.swift
//  Calculator
//
//  Created by Мустафа Натур on 17.10.2022.
//

import Foundation
import UIKit

extension UIButton {
    func dim (){
        UIView.animate(withDuration: 0.2, animations: {self.alpha = 0.6}, completion: {_ in UIView.animate(withDuration: 0.2, animations: {self.alpha = 1.0})})
    }
}
