//
//  TextFieldWidthPadding.swift
//  Navigation
//
//  Created by MacBook Air on 13.10.2022.
//

import UIKit

class TextFieldWidthPadding: UITextField {
    
 var textPadding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 20)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
