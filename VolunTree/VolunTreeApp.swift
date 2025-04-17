//
//  VolunTreeApp.swift
//  VolunTree
//
//  Created by Tahamina Mostafa chowdhury on 2025-03-03.
//

import SwiftUI
import FirebaseCore

// This function gets called once the app finishes launching.
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct VolunTreeApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            Starter()
        }
    }
}
