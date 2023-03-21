//
//  StretchPage.swift
//  Baduuut
//
//  Created by Jevon Levin on 20/03/23.
//

import SwiftUI

struct StretchPage: View {
    var movement: Movement = movements.randomElement()!
    
    @State private var isFirstTime: Bool = true
    @State private var isTimerVisible: Bool = true
    @State private var timeRemaining = 3
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        MasterView(
            title: isFirstTime ? "Let's stretch!" : movement.name,
            subtitle: isFirstTime ? "- or not. We don't really care." : "",
            isTimerVisible: $isTimerVisible,
            timeRemaining: $timeRemaining
        ){
            
            NavigationLink("Skip"){
                OnboardPage()
            }
            .fontWeight(.semibold)
            .padding()
            .frame(width: UIScreen.main.bounds.width - 32)
            .font(.system(size: 18))
            .background(Color(red: 224/255, green: 56/255, blue: 56/255))
            .foregroundColor(.white)
            .cornerRadius(8)
            
        }.onReceive(timer){ time in
            guard isTimerVisible else {
                return
            }
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                if isFirstTime {
                    timeRemaining = movement.duration
                    isFirstTime = false
                }
            }
            
        }
    }
}

struct StretchPage_Previews: PreviewProvider {
    static var previews: some View {
        StretchPage()
    }
}
