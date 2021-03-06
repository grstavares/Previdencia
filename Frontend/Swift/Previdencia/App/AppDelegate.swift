//
//  AppDelegate.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 28/04/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    public static var appDisplayName: String = "SenaPrev"
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let back = UIColor(red: 53 / 255, green: 91 / 255, blue: 124 / 255, alpha: 1)
        let text = UIColor(red: 75 / 255, green: 125 / 255, blue: 170 / 255, alpha: 1)
        let tint = UIColor(red: 104 / 255, green: 154 / 255, blue: 199 / 255, alpha: 1)
        let selection = UIColor(red: 251 / 255, green: 249 / 255, blue: 132 / 255, alpha: 1)
        AppColorPallete.shared.setPallete(background: back, fisrtLayer: tint, text: text, tint: tint, selection: selection)
        
        let theme: AppTheme = AppTheme(statusBarStyle: .default, barBackgroundColor: back, barForegroundColor: UIColor.white, backgroundColor: UIColor.clear, textColor: text)
        AppCoordinator.shared.currentTheme = theme
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

