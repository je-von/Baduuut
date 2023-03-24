//
//  ContentView.swift
//  Baduuut
//
//  Created by Leo Harnadi on 20/03/23.
//

import SwiftUI
import UserNotifications
enum Page {
    case onboard, stretch
}

struct ContentView: View {
    @ObservedObject var appState = AppState.shared
    @State private var currentPage: Page = .onboard
    init(){
        UINavigationBar.setAnimationsEnabled(false)
        if appState.isOpenedFromNotification == true {
            currentPage = .stretch
        }
    }
    var body: some View {
        if currentPage == .onboard{
            OnboardPage(currentPage: $currentPage)
        } else {
            StretchPage(currentPage: $currentPage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
