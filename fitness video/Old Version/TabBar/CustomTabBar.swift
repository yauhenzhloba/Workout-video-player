//
//  CustomTabBar.swift
//  fitness video
//
//  Created by EUGENE on 2/15/19.
//  Copyright © 2019 Yauhen Zhloba. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBarController {

    @IBOutlet weak var myTabBar: UITabBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTabBar?.tintColor = UIColor.white
        myTabBar?.barTintColor = UIColor( red: CGFloat(255/255.0), green: CGFloat(47/255.0), blue: CGFloat(146/255.0), alpha: CGFloat(1.0) )
        tabBarItem.title = ""
        
        setTabBarItems()
        // Do any additional setup after loading the view.
        self.selectedIndex = 1
    }
    
    func setTabBarItems(){
        
        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
        myTabBarItem1.image = UIImage(named: "result")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem1.selectedImage = UIImage(named: "resultselected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem1.title = ""
        myTabBarItem1.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

//        let myTabBarItem2 = (self.tabBar.items?[1])! as UITabBarItem
//        myTabBarItem2.image = UIImage(named: "program")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem2.selectedImage = UIImage(named: "programselected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem2.title = ""
//        myTabBarItem2.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
//
//
//        let myTabBarItem3 = (self.tabBar.items?[2])! as UITabBarItem
//        myTabBarItem3.image = UIImage(named: "food")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem3.selectedImage = UIImage(named: "foodselected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem3.title = ""
//        myTabBarItem3.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
//
//        let myTabBarItem4 = (self.tabBar.items?[3])! as UITabBarItem
//        myTabBarItem4.image = UIImage(named: "music")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem4.selectedImage = UIImage(named: "musicselected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem4.title = ""
//        myTabBarItem4.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
//light pink FDCDEE
        
    }
  


}
