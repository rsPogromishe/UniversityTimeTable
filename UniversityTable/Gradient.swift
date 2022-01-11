//
//  Gradient.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 11.01.2022.
//

import Foundation
import UIKit

class GradientLayer: UIView {
    let gradientLayer = CAGradientLayer()
    let startColor = UIColor(red: 53, green: 61, blue: 100, alpha: 0)
    let endColor = UIColor(red: 53, green: 61, blue: 100, alpha: 1)
    
    private func gradientSetu() {
        gradientLayer.colors = [ startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
    }
    func setupGradient() {
        layer.addSublayer(gradientLayer)
        gradientSetu()
    }
}
