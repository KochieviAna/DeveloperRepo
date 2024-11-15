//
//  SceneDelegate.swift
//  Assignment25
//
//  Created by MacBook on 15.11.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        
        let vc = StartViewController()
        let navigationVC = UINavigationController(rootViewController: vc)
        
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
    }
}

