//
//  StretchPage.swift
//  Baduuut
//
//  Created by Jevon Levin on 20/03/23.
//

import SwiftUI

struct StretchPage: View {
    @State private var isTimerVisible: Bool = false
    @State private var timeRemaining = 20
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            Circle()
                .foregroundColor(Color(red: 224/255, green: 152/255, blue: 56/255))
                .frame(width: 685, height: 685)
                .offset(y: -200) // Masih nembak, kalo di Sketch -137
            VStack (spacing: 0) {
                Text("Let's stretch!")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text("- or not. We don't really care.")
                    .foregroundColor(.white)
                    .padding(.top, 5)
                ZStack {
                    if isTimerVisible{
                        Text("\(timeRemaining)")
                            .font(.system(size: 310, weight: .thin))
                            .foregroundColor(.white)
                            .offset(y: -30)
                            
                    }
                    // Dummy clown
                    Image("dummy")
                        .scaleEffect(1.5)
                        .offset(y: 100)
                }
                
                Spacer()
                
                
                if !isTimerVisible {
                    Button("Chop chop!"){
                        withAnimation(.easeIn){
                            isTimerVisible = true
                        }
                    }
                    .foregroundColor(Color(red: 16/255, green: 38/255, blue: 67/255))
                    .fontWeight(.semibold)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 32)
                    .background(.white)
                    .cornerRadius(8)
                }
                
            }
            .padding()
        }
        .background(Color(red: 16/255, green: 38/255, blue: 67/255))
        .onReceive(timer){ time in
            guard isTimerVisible else {
                return
            }
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                isTimerVisible = false
                // fix: tergantung strecth?
                timeRemaining = 20
            }
            
        }
    }
}

struct StretchPage_Previews: PreviewProvider {
    static var previews: some View {
        StretchPage()
    }
}
