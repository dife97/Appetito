//
//  SceneDelegate.swift
//  Appetito
//
//  Created by Diego Rodrigues on 26/08/22.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        if Auth.auth().currentUser == nil {
            window?.rootViewController = UINavigationController(rootViewController: InitialViewController())

            window?.makeKeyAndVisible()
        } else {
        
            let homeViewController = HomeViewController()
            let myReservationController = MyReservationViewController()
            let perfilViewController = PerfilViewController()
        
            myReservationController.tabBarItem = UITabBarItem(title: "Reservas", image: UIImage(systemName: "folder"), selectedImage: UIImage(systemName: "folder.fill"))
            myReservationController.tabBarItem.tag = 1
            
            let tabbar = UITabBarController()
            homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
            homeViewController.tabBarItem.tag = 0
            perfilViewController.tabBarItem = UITabBarItem(title: "Perfil", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
            perfilViewController.tabBarItem.tag = 2
            
            let navigationController = UINavigationController(rootViewController: homeViewController)
            tabbar.viewControllers = [navigationController, myReservationController, perfilViewController]
            tabbar.modalPresentationStyle = .fullScreen
            tabbar.view.backgroundColor = UIColor(named: "mainBackground")
            tabbar.tabBar.isTranslucent = false
            tabbar.view.tintColor = UIColor.white
        
            window?.rootViewController = tabbar

            window?.makeKeyAndVisible()
        }

        return
    }
}

