//
//  PageViewController.swift
//  SmartShop
//
//  Created by webwerks on 02/06/18.
//  Copyright © 2018 webwerks. All rights reserved.
//

import UIKit

protocol PageViewControllerDelegate:class{
    func movetoHomeView()
}


class PageViewController: UIPageViewController {
   var pageControlNib = PageControlView()
    weak var delagatePageVC:PageViewControllerDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupPageIndicator()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    lazy var arrViewControllers :[ UIViewController ] = {
        let initalVC = Utility.loadViewControllerUsingIdentifier(IdentifierConst.kInitialVC, storyBoardName: StoryBoardConst.kPagerStoryBoard) as! FirstViewController
        let secondVC = Utility.loadViewControllerUsingIdentifier(IdentifierConst.kSecondVC, storyBoardName: StoryBoardConst.kPagerStoryBoard) as! SecondViewController
        
         let finalVC = Utility.loadViewControllerUsingIdentifier(IdentifierConst.KFinalVC, storyBoardName: StoryBoardConst.kPagerStoryBoard) as! LastViewController
        return [initalVC,secondVC,finalVC]
    }()
    
    
    func setupViewController(){
        dataSource = self
        delegate = self
        if let firstViewController = arrViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }

    func setupPageIndicator(){
        pageControlNib = (PageControlView().loadNib() as? PageControlView)!
        pageControlNib.frame =  CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50)
       pageControlNib.pageControl.currentPage = 0
       pageControlNib.pageControl.tintColor = UIColor.black
        pageControlNib.pageControl.pageIndicatorTintColor = UIColor.white
        pageControlNib.pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControlNib.delegate = self
        self.view.addSubview(pageControlNib)
    }
    
    func nextPage(){
        let pageContentViewController = self.viewControllers![0]
        self.pageControlNib.pageControl.currentPage = arrViewControllers.index(of: pageContentViewController)!
        let nextpageCount = arrViewControllers.index(of: pageContentViewController)! + 1
        if(arrViewControllers.count != nextpageCount){
        self.setViewControllers([arrViewControllers[nextpageCount]], direction: .forward, animated: true, completion: nil)
            pageControlNib.pageControl.currentPage = nextpageCount
        }else{
            delagatePageVC.movetoHomeView()
        }

    }
    
    func previousPage(){
        let pageContentViewController = self.viewControllers![0]
        self.pageControlNib.pageControl.currentPage = arrViewControllers.index(of: pageContentViewController)!
        let nextpageCount = arrViewControllers.index(of: pageContentViewController)! - 1
        if(nextpageCount >= 0){
            self.setViewControllers([arrViewControllers[nextpageCount]], direction: .forward, animated: true, completion: nil)
            pageControlNib.pageControl.currentPage = nextpageCount
       }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension PageViewController : UIPageViewControllerDelegate ,UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = arrViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard arrViewControllers.count > previousIndex else {
            return nil
        }
        return arrViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = arrViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = arrViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return arrViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        
       self.pageControlNib.pageControl.currentPage = arrViewControllers.index(of: pageContentViewController)!
    }
}

extension PageViewController:PageViewDelegate{
    func onCLickOfNextButton() {
     nextPage()
    }
    func onClickPreviousBtn() {
        previousPage()
    }
}
