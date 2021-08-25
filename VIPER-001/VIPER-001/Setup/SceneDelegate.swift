//
//  SceneDelegate.swift
//  VIPER-001
//
//  Created by omrobbie on 25/08/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let router = UserRouter.start()
        let initialViewController = router.entryPoint

        let window = UIWindow.init(windowScene: windowScene)
        window.rootViewController = initialViewController
        self.window = window
        window.makeKeyAndVisible()
    }
}
