//
//  StretchPage.swift
//  Baduuut
//
//  Created by Jevon Levin on 20/03/23.
//

import SwiftUI
struct StretchPage: View {
    @Binding var currentPage: Page
    var movement: Movement = movements.randomElement()!
    
    @State private var isFirstTime: Bool = true
    @State private var isTimerVisible: Bool = true
    @State private var timeRemaining = 3

    var body: some View {
        MasterView(
            title: isFirstTime ? "Let's stretch!" : movement.name,
            subtitle: isFirstTime ? "- or not. I don't really care." : "",
            isTimerVisible: $isTimerVisible,
            timeRemaining: $timeRemaining
        ){
            Button("Skip"){
                currentPage = .onboard
            }
            .fontWeight(.semibold)
            .padding()
            .frame(width: UIScreen.main.bounds.width - 32)
            .font(.system(size: 18))
            .background(Color("Danger"))
            .foregroundColor(.white)
            .cornerRadius(8)
            .shadow(radius: 10)
            
        }
        .onReceive(globalTimer){ time in
            guard isTimerVisible else {
                return
            }
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                if isFirstTime {
                    timeRemaining = movement.duration
                    isFirstTime = false
                } else {
                    currentPage = .onboard
                }
            }
            
        }
        .onAppear{
            print("kebuka")
        }
    }
}

struct StretchPage_Previews: PreviewProvider {
    static var previews: some View {
        StretchPage(currentPage: .constant(.stretch))
    }
}
