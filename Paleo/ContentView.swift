//
//  ContentView.swift
//  Paleo
//
//  Created by Adam Wilkie on 4/24/23.
//

import SwiftUI
import UIKit
import Firebase

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        
        // Initialize Firebase
        FirebaseApp.configure()
        
        // Create a window and set it as the app's key window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: RecipeListViewController())
        window?.makeKeyAndVisible()
        
        return true
    }
    
}
