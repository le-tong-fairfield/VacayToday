//
//  SceneDelegate.swift
//  VacayToday
//
//  Created by Le Lan Khanh on 18/04/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
//        let defaults = UserDefaults.standard
//        if let savedUserData = defaults.object(forKey: "user") as? Data {
//            let decoder = JSONDecoder()
//            if let savedUser = try? decoder.decode(User.self, from: savedUserData) {
//                // Look for file named Login.storyboard
//                let storyboard = UIStoryboard(name: "Login", bundle: nil)
//                // Creat a tab bar controller named TabBarController in storyboard
//                let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
//                // Set to root view
//                window?.rootViewController = tabBarController
//                // Get first tab item navigation controller
//                let nav = tabBarController.viewControllers?[0] as! UINavigationController
//                // Get the view controller from the navigation controller
//                let feedViewController = nav.topViewController as! FeedViewController
//                // Pass model controller to feed view controller
//                let modelController = ModelController()
//                modelController.user = savedUser
//                feedViewController.modelController = modelController
//            }
//        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

