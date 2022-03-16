//
//  Extensions.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 16.03.2022.
//

import UIKit

public extension UIColor {
    static func setColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        let color = UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
        return color
    }
}
