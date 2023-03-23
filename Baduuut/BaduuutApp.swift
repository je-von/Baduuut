//
//  BaduuutApp.swift
//  Baduuut
//
//  Created by Leo Harnadi on 20/03/23.
//

import SwiftUI
import UserNotifications
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
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
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let notificationIdentifier = response.notification.request.identifier
        switch notificationIdentifier {
        case "BADUUUT_STRETCH_NOTIF_ID":
            
            AppState.shared.isOpenedFromNotification = true
        default:
            AppState.shared.isOpenedFromNotification = false
            break
        }
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
