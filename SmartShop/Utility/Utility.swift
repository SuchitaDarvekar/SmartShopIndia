//
//  Utility.swift
//  SmartShop
//
//  Created by webwerks on 02/06/18.
//  Copyright © 2018 webwerks. All rights reserved.
//

import Foundation
import UIKit


class Utility {
  
class func loadViewControllerUsingIdentifier(_ identifier: String, storyBoardName: String) -> AnyObject! {
    let storyboard = UIStoryboard(name: storyBoardName , bundle: nil)
    let viewController: AnyObject! = storyboard.instantiateViewController(withIdentifier: identifier)
    return viewController;
}
    
}
