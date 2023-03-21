//
//  OnboardPage.swift
//  Baduuut
//
//  Created by Jevon Levin on 21/03/23.
//

import SwiftUI
import Lottie
struct OnboardPage: View {
    @State private var hasStarted = false
    @State private var selectedTime = "Every 30 minutes"
    let times = ["Every 15 seconds", "Every 30 minutes", "Every 1 hour", "Every 2 hours"]
    let message: String = welcomeMessages.randomElement()!
    
    @State private var isModalVisible = false

        let heights = stride(from: 0.1, through: 1.0, by: 0.1).map { PresentationDetent.fraction($0) }

    
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
 
                Spacer()
                
                LottieView(lottieFile: "dummy-2")
                    .offset(y: 15)
                    .scaleEffect(1.6)
                
                
                VStack(spacing: .none){
                    Spacer()
                    if !hasStarted{
                        Text("How often should I bug you?")
                            .multilineTextAlignment(.center)
                            .font(.title2)
                            .bold()
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(.white)
                        
                        Picker("Time", selection: $selectedTime) {
                            ForEach(times, id: \.self) {
                                Text($0)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color(red: 224/255, green: 152/255, blue: 56/255))
                                    
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(height: 120)
                        .scaleEffect(1.1)
                        .padding(.bottom, -5)
                        .padding(.top, -17)
                        
                        //                    .padding()
                        //                    .frame(width: UIScreen.main.bounds.width - 32)
                        //                    .background(.white)
                        //                    .padding()
                        //                    .pickerStyle(.wheel)
                        
                        Button("Start!"){
                            withAnimation{
                                hasStarted = true
                            }
                        }
                        .foregroundColor(Color(red: 16/255, green: 38/255, blue: 67/255))
                        .fontWeight(.semibold)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 32)
                        .background(.white)
                        .cornerRadius(8)
                    } else {
                        Button("Stop!"){
                            withAnimation{
                                hasStarted = false
                            }
                        }
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 32)
                        .background(Color(red: 224/255, green: 56/255, blue: 56/255))
                        .cornerRadius(8)
                    }
                    
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
