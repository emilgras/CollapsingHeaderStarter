//
//  PageMenuViewController.swift
//  CollapsingHeaderStarter
//
//  Created by Emil Gräs on 28/08/2016.
//  Copyright © 2016 Emil Gräs. All rights reserved.
//

import UIKit
import PageMenu

class PageMenuViewController: UIViewController {

    var pageMenu: CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupPageController() {
        var menuControllers: [UIViewController] = []
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let firstVC = storyboard.instantiateViewControllerWithIdentifier("FirstViewController") as! FirstViewController
        firstVC.title = "First"
        menuControllers.append(firstVC)
        
        let secondVC = storyboard.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
        secondVC.title = "Second"
        menuControllers.append(secondVC)
        
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        let parameters: [CAPSPageMenuOption] = [
            .MenuItemSeparatorWidth(0),
            .UseMenuLikeSegmentedControl(true),
            .MenuItemSeparatorPercentageHeight(0),
            CAPSPageMenuOption.SelectedMenuItemLabelColor(UIColor.blackColor()),
            CAPSPageMenuOption.UnselectedMenuItemLabelColor(UIColor.blackColor()),
            CAPSPageMenuOption.SelectionIndicatorColor(UIColor.blackColor()),
            CAPSPageMenuOption.SelectionIndicatorHeight(CGFloat(2.0)),
            CAPSPageMenuOption.AddBottomMenuHairline(false),
            CAPSPageMenuOption.MenuHeight(CGFloat(45)),
            CAPSPageMenuOption.ScrollMenuBackgroundColor(UIColor.whiteColor()),
            CAPSPageMenuOption.EnableHorizontalBounce(true)
        ]
        
        // Initialize page menu with controller array, frame, and optional parameters
        //let profileHeaderViewHeight = profileHeaderView.frame.size.height

        
        pageMenu = CAPSPageMenu(viewControllers: menuControllers, frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(pageMenu!.view)
    }

}

