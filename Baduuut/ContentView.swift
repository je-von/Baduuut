//
//  ContentView.swift
//  Baduuut
//
//  Created by Leo Harnadi on 20/03/23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @ObservedObject var appState = AppState.shared
//    var pushNavigationBinding : Binding<Bool> {
//        .init { () -> Bool in
//            appState.isOpenedFromNotification != nil
//        } set: { (newValue) in
//            if !newValue { appState.isOpenedFromNotification = nil }
//        }
//    }
    init(){
//        UINavigationBar.setAnimationsEnabled(false)
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//            if success {
//                print("All set!")
//            } else if let error = error {
//                print(error.localizedDescription)
//            }
//        }
        
    }
    var body: some View {
        //        StretchPage()
        if appState.isOpenedFromNotification == true {
            StretchPage()
        } else {
            OnboardPage()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
