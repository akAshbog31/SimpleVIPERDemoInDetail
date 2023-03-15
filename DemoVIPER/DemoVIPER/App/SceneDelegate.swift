//
//  SceneDelegate.swift
//  DemoVIPER
//
//  Created by mac on 10/03/23.
//

import UIKit
import FirebaseAuth

enum ModuleType {
    case logIn
    case home
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController?.navigationController?.navigationBar.isHidden = true
        if Auth.auth().currentUser != nil {
            showViewControoler(module: .home)
        } else {
            showViewControoler(module: .logIn)
        }
    }
    
    func showViewControoler(module: ModuleType) {
        guard let window = window else { return }
        switch module {
        case .logIn:
            window.rootViewController = UINavigationController(rootViewController: LogInRouter.createLogInModule())
        case .home:
            window.rootViewController = UINavigationController(rootViewController: HomeRouter.createHomeModedule())
        }
        window.makeKeyAndVisible()
    }
}

