//
//  Colors++.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 16/08/2024.
//

import Foundation
import UIKit

enum ColorPalette {
    case buttonPrimary
    case backgroundBrand
    case backgroundSecondard
    case textPrimary
    case textSecondary

    var color: UIColor {
        switch self {
        case .buttonPrimary:
            return UIColor.init(hex: "#2765CF") ?? UIColor.blue
        case .backgroundBrand:
            return UIColor.init(hex: "#0D3880") ?? UIColor.black
        case .backgroundSecondard:
            return UIColor.init(hex: "#EFF3FB") ?? UIColor.white
        case .textPrimary:
            return UIColor.init(hex: "#333A49") ?? UIColor.black
        case .textSecondary:
            return UIColor.init(hex: "#69768C") ?? UIColor.black
        }
    }
}
