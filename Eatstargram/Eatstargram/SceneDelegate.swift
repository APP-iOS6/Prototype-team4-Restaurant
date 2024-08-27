//
//  SceneDelegate.swift
//  Eatstargram
//
//  Created by 박준영 on 8/27/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let mainViewController = RestaurantDetailViewController()
        mainViewController.tabBarItem = UITabBarItem(title: "메인화면", image: UIImage(systemName: "smallcircle.fill.circle.fill"), tag: 0)
        
        let addViewController = AddViewController()
        addViewController.tabBarItem = UITabBarItem(title: "추가", image: UIImage(systemName: "smallcircle.fill.circle.fill"), tag: 1)
        
        let userViewController = UserViewController()
        userViewController.tabBarItem = UITabBarItem(title: "프로필", image: UIImage(systemName: "smallcircle.fill.circle.fill"), tag: 2)
        
        let settingViewController = SettingViewController()
        settingViewController.tabBarItem = UITabBarItem(title: "설정", image: UIImage(systemName: "smallcircle.fill.circle.fill"), tag: 3)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [mainViewController, addViewController, userViewController, settingViewController]
        window?.rootViewController = tabBarController
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}


}

