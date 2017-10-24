//
//  SplashController.swift
//  Bridge
//
//  Created by izran khan on 2017-10-06.
//  Copyright © 2017 TechEase. All rights reserved.
//

import UIKit

class SplashController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    let pages = ["firstSplashScreen","secondSplashScreen",
                 "thirdSplashScreen","fourthSplashScreen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "firstSplashScreen")
        setViewControllers([vc!],direction:.forward,
                           animated: true,
                           completion: nil)
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let identifier = viewController.restorationIdentifier{
            if let index = pages.index(of:identifier){
                if index > 0{
                    return self.storyboard?.instantiateViewController(withIdentifier: pages[index-1])
                }
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let identifier = viewController.restorationIdentifier{
            if let index = pages.index(of:identifier){
                if index < pages.count - 1{
                    return self.storyboard?.instantiateViewController(withIdentifier: pages[index+1])
                }
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        if let identifier = viewControllers?.first?.restorationIdentifier{
            if let index = pages.index(of:identifier){
                return index
            }
        }
        return 0
    }

    
    

}


/*
 UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
 
 var pageControl = UIPageControl()
 
 override func viewDidLoad() {
 super.viewDidLoad()
 self.dataSource = self
 self.delegate=self
 configurePageControl()
 
 // This sets up the first view that will show up on our page control
 if let firstViewController = orderedViewControllers.first {
 setViewControllers([firstViewController],
 direction: .forward,
 animated: true,
 completion: nil)
 }
 
 
 
 }
 
 @IBAction func getStarted(_ sender: Any){
 performSegue(withIdentifier: "getStarted", sender: sender)
 }
 
 func newVc(viewController: String) -> UIViewController {
 return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
 }
 
 lazy var orderedViewControllers: [UIViewController] = {
 return [self.newVc(viewController: "firstSplash"),
 self.newVc(viewController: "secondSplash"),
 self.newVc(viewController: "thirdSplash"),
 self.newVc(viewController: "fourthSplash")]
 }()
 
 // MARK: Data source functions.
 func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
 guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
 return nil
 }
 
 let previousIndex = viewControllerIndex - 1
 
 // User is on the first view controller and swiped left to loop to
 // the last view controller.
 guard previousIndex >= 0 else {
 return orderedViewControllers.last
 // Uncommment the line below, remove the line above if you don't want the page control to loop.
 // return nil
 }
 
 guard orderedViewControllers.count > previousIndex else {
 return nil
 }
 
 return orderedViewControllers[previousIndex]
 }
 
 func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
 guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
 return nil
 }
 
 let nextIndex = viewControllerIndex + 1
 let orderedViewControllersCount = orderedViewControllers.count
 
 // User is on the last view controller and swiped right to loop to
 // the first view controller.
 guard orderedViewControllersCount != nextIndex else {
 return orderedViewControllers.first
 // Uncommment the line below, remove the line above if you don't want the page control to loop.
 // return nil
 }
 
 guard orderedViewControllersCount > nextIndex else {
 return nil
 }
 
 return orderedViewControllers[nextIndex]
 }
 
 func configurePageControl() {
 // The total number of pages that are available is based on how many available colors we have.
 pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 220,width: UIScreen.main.bounds.width,height: 100))
 self.pageControl.numberOfPages = orderedViewControllers.count
 self.pageControl.currentPage = 0
 self.pageControl.tintColor = UIColor.black
 self.pageControl.pageIndicatorTintColor = UIColor.init(red: 216/255.0, green: 216/255.0, blue: 216/255.0, alpha: 1)
 self.pageControl.currentPageIndicatorTintColor = UIColor.init(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1)
 self.view.addSubview(pageControl)
 }
 
 func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
 let pageContentViewController = pageViewController.viewControllers![0]
 self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
 }
 
 override func viewDidLayoutSubviews() {
 pageControl.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
 
 }
 */


/*
 

 */

