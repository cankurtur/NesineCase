//
//  SceneDelegate.swift
//  NesineCase
//
//  Created by Can Kurtur on 11.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let navCon = HomeRouter.createModule()
        window?.rootViewController = navCon
        window?.makeKeyAndVisible()
    }

}

