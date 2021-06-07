//
//  MainTabController.swift
//  Aplus
//
//  Created by hsh on 2021/06/08.
//

import UIKit

class MainTabController:UITabBarController{
    @IBOutlet weak var tabBarMain: UITabBar!
    
    var classTitle:String?
    override func viewDidLoad() {
        tabBarMain.unselectedItemTintColor = .darkGray
        
        // 전 화면에서 prepare해서 가져온 변수를
        // title로 지정
        if classTitle != nil{
            self.title = classTitle
        }
    }
}
