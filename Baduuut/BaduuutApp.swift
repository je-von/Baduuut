//
//  BaduuutApp.swift
//  Baduuut
//
//  Created by Leo Harnadi on 20/03/23.
//

import SwiftUI
import UserNotifications
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    //    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    //
    //        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    //            print("Dispatch")
    //            AppState.shared.isOpenedFromNotification = true
    //        }
    //
    //        return true
    //    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UINavigationBar.setAnimationsEnabled(false)
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        UIApplication.shared.applicationIconBadgeNumber = 0
        // start notification while app is in Foreground
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        // Get the notification's identifier to identify which view to open
        let notificationIdentifier = response.notification.request.identifier
        
        // Open the specific view based on the notification's identifier
        print("asdfgh")
        switch notificationIdentifier {
        case "BADUUUT_STRETCH_NOTIF_ID":
            
            AppState.shared.isOpenedFromNotification = true
        default:
            AppState.shared.isOpenedFromNotification = false
            break
        }
        
        // Call the completion handler after you're done processing the notification
        completionHandler()
    }
}

class AppState: ObservableObject {
    static let shared = AppState()
    @Published var isOpenedFromNotification : Bool?
}

@main
struct BaduuutApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
