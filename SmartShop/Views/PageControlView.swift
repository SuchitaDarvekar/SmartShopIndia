//
//  PageControlView.swift
//  SmartShop
//
//  Created by webwerks on 02/06/18.
//  Copyright © 2018 webwerks. All rights reserved.
//

import Foundation
import UIKit

protocol PageViewDelegate:class {
    func onCLickOfNextButton()
    func onClickPreviousBtn()
}
class PageControlView: UIView {
    
    
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var tbnPrevious: UIButton!
    
    weak var delegate:PageViewDelegate!
    
    @IBAction func actionOnPreviousBtn(_ sender: UIButton) {
        delegate.onClickPreviousBtn()
    }
    
    @IBAction func actionOnNextBtn(_ sender: UIButton) {
       delegate.onCLickOfNextButton()
    }
    
}
