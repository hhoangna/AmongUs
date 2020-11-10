//
//  BaseTabbar.swift
//  AmongUs
//
//  Created by HHumorous on 10/11/2020.
//

import UIKit

class BaseTabbar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTabbar()
    }

    func setupTabbar() {
        let homeVC: HomeVC = .load(SB: .Main)
        let homeNav = BaseNV(rootViewController: homeVC)
        homeNav.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "iconsHome-Selected"), selectedImage: #imageLiteral(resourceName: "iconsHome"))
        
        let wallVC: WallpaperVC = .load(SB: .Main)
        let wallNav = BaseNV(rootViewController: wallVC)
        wallNav.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "iconsWallpaper"), selectedImage: #imageLiteral(resourceName: "iconsWallpaper-Selected"))
        
        let stickerVC: StickerVC = .load(SB: .Main)
        let stickerNav = BaseNV(rootViewController: stickerVC)
        stickerNav.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "iconsSticker"), selectedImage: #imageLiteral(resourceName: "iconsSticker-Selected"))
        
        let settingVC: SettingVC = .load(SB: .Main)
        let settingNav = BaseNV(rootViewController: settingVC)
        settingNav.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "iconsSetting"), selectedImage: #imageLiteral(resourceName: "iconsSetting"))
                
        self.viewControllers = [homeNav, wallNav, stickerNav, settingNav]
        self.tabBar.isTranslucent = true
        self.tabBar.tintColor = UIColor.white
        self.tabBar.unselectedItemTintColor = UIColor.white.withAlphaComponent(0.3)
        let appearance = self.tabBar.standardAppearance.copy()
        appearance.shadowImage = UIColor.clear.image()
        appearance.backgroundColor = UIColor(hex: "1a1a1a")
        self.tabBar.standardAppearance = appearance
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let idx = tabBar.items?.firstIndex(of: item), tabBar.subviews.count > idx + 1, let imageView = tabBar.subviews[idx + 1].subviews.first as? UIImageView else {
            return
        }

        imageView.layer.add(CAAnimation().bounceAnimation(), forKey: nil)
    }
}
