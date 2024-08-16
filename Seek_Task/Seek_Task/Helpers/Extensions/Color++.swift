//
//  Color++.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 13/08/2024.
//

import Foundation
import UIKit

extension UIColor {
    /// Initializes a UIColor object from a hexadecimal color string.
    /// - Parameters:
    ///   - hex: The hexadecimal color string, e.g., "#RRGGBB" or "RRGGBB".
    ///   - alpha: The alpha value of the color (0.0 to 1.0). Defaults to 1.0.
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            return nil
        }
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
