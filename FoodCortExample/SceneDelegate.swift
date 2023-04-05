//
//  SceneDelegate.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 03.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let mainTabBArCoordinator = MainTabBarCoordinator().strongRouter

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { fatalError("No one window scene exist") }
        window = UIWindow(windowScene: windowScene)
        mainTabBArCoordinator.setRoot(for: window!)
    }

}

