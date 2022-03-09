//
//  LoadingView.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 19.02.2022.
//

import Foundation
import UIKit

class LoadingView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)
        addSubview(contentView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = bounds
    }
    
    func configure() {
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
    }
}
