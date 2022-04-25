//
//  LoadingView.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 19.02.2022.
//

import Foundation
import UIKit

class LoadingView: UIView {
    
    static var viewOfLoading: UIView?
    
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
    
    class func startAnimating(mainView: UIView) {
        let inView = LoadingView()
        inView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        mainView.addSubview(inView)
        inView.isHidden = false
        inView.loadingIndicator.startAnimating()
        self.viewOfLoading = inView
    }
    
    class func stopAnimating() {
        viewOfLoading?.removeFromSuperview()
        viewOfLoading = nil
    }
}
