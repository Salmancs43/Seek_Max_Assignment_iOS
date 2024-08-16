//
//  LoginTextField.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 13/08/2024.
//
import UIKit
import Foundation

class LoginTextField: UITextField {


    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }

}
