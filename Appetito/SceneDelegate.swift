//
//  SceneDelegate.swift
//  Appetito
//
//  Created by Diego Rodrigues on 26/08/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: InitialViewController())
//        window?.rootViewController = UINavigationController(rootViewController: InitialViewController())
        window?.makeKeyAndVisible()

        return
    }
}

