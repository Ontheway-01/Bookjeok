//
//  AppDelegate.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/05/30.
//

import UIKit


let colorList : [String : UIColor] = ["Coral": UIColor.systemPink,
                                      "Yellow":UIColor.yellow,
                                      "Green":UIColor.green,
                                      "Blue":UIColor.blue,
                                      "Purple":UIColor.purple,
                                      "Gray":UIColor.gray,
]
let fontList = ["Arial", "ArialHebrew",
                "Avenir-Black",
                "AvenirNext-Bold"
]

//extension UIColor {
//    public static var Coral = colorFromHexString(hexString: "#CDCDCD")
//
//    public static func colorFromHexString(hexString: String) -> UIColor {
//        unsigned rgbValue = 0;
//        NSScanner *scanner = [NSScanner scannerWithString:hexString];
//        [scanner setScanLocation:1]; // bypass '#' character
//        [scanner scanHexInt:&rgbValue];
//        return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
//    }
//}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

