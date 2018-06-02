//
//  Extension.swift
//  SmartShop
//
//  Created by webwerks on 02/06/18.
//  Copyright © 2018 webwerks. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    func loadViewController(_storyBIdentifier:String) -> AnyObject!{
        let storyboard = UIStoryboard(name: _storyBIdentifier, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self))
    }
}


    extension UIView {
        /** Loads instance from nib with the same name. */
        func loadNib() -> UIView {
            let bundle = Bundle(for: type(of: self))
            let nibName = type(of: self).description().components(separatedBy: ".").last!
            let nib = UINib(nibName: nibName, bundle: bundle)
            return nib.instantiate(withOwner: self, options: nil).first as! UIView
        }
    }

