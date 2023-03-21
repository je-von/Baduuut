//
//  OnboardPage.swift
//  Baduuut
//
//  Created by Jevon Levin on 21/03/23.
//

import SwiftUI

struct OnboardPage: View {
    @State private var selectedTime = "Mild"
    let times = ["Every 15 seconds", "Every 30 minutes", "Every 1 hour", "Every 2 hours"]
    let message: String = welcomeMessages.randomElement()!
    var body: some View {
        
        ZStack {
            Circle()
                .foregroundColor(Color(red: 224/255, green: 152/255, blue: 56/255))
                .frame(width: 685, height: 685)
                .offset(y: -250) // Masih nembak, kalo di Sketch -137
            VStack (spacing: 0) {
                
                VStack(spacing: 0){
                    Text("Oh, hi 😒")
                        .fontWeight(.bold)
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                    Text(message)
                        .font(.system(size: 18))
                        .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width - 32)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.top, 5)
                    Spacer()
                }.frame(height: 140)
                //                Dummy image
                Image("dummy")
                    .scaleEffect(1.2)
                
                
                
                Spacer()
                
                
                VStack(spacing: .none){
                    Text("How often should I bug you and disrupt your work?")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .bold()
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.white)
                    
                    Picker("Time", selection: $selectedTime) {
                        ForEach(times, id: \.self) {
                            Text($0)
//                                .fontWeight(.medium)
//                                .foregroundColor(Color(red: 224/255, green: 152/255, blue: 56/255))
                                
                        }
                    }
                    .pickerStyle(.wheel)
                    .scaleEffect(1.1)
                    .padding(.bottom, 15)
                    //                    .padding()
                    //                    .frame(width: UIScreen.main.bounds.width - 32)
                    //                    .background(.white)
                    //                    .padding()
                    //                    .pickerStyle(.wheel)
                    
                    Button("Start!"){
                        
                    }
                    .foregroundColor(Color(red: 16/255, green: 38/255, blue: 67/255))
                    .fontWeight(.semibold)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 32)
                    .background(.white)
                    .cornerRadius(8)
                    
                }
                .frame(width: UIScreen.main.bounds.width - 32)
                
            }
            .padding()
        }
        .background(Color(red: 16/255, green: 38/255, blue: 67/255))
    }
}

struct OnboardPage_Previews: PreviewProvider {
    static var previews: some View {
        OnboardPage()
    }
}
