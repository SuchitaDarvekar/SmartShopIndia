//
//  RootViewController.swift
//  SmartShop
//
//  Created by webwerks on 02/06/18.
//  Copyright © 2018 webwerks. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let vc = Utility.loadViewControllerUsingIdentifier("PageVC", storyBoardName: StoryBoardConst.kPagerStoryBoard) as? PageViewController {
            vc.delagatePageVC = self
        self.navigationController?.pushViewController(vc, animated: false)
            
        }
    }
    
   
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension RootViewController : PageViewControllerDelegate{
    func movetoHomeView() {
        print("homeVC")
    }
}
