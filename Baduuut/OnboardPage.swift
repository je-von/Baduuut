//
//  OnboardPage.swift
//  Baduuut
//
//  Created by Jevon Levin on 21/03/23.
//

import SwiftUI
import Lottie
struct OnboardPage: View {
    @State private var isSheetVisible = false
//    @State private var hasStarted = false
    @State private var selectedTime = "Every 30 minutes"
    let times = ["Every 15 seconds", "Every 30 minutes", "Every 1 hour", "Every 2 hours"]
    let message: String = welcomeMessages.randomElement()!
    
    var body: some View {
        MasterView(title: "Oh, hi 😒", subtitle: message){
            
            Text("00:00:00")
                .fontWeight(.bold)
                .font(.system(size: 40))
                .foregroundColor(.white)
            
            Text("until your next stretch")
                .font(.system(size: 18))
                .foregroundColor(.white)
                .padding(.bottom, 20)
            
            //fix: tulisannya, warna button?
            Button("Set Session"){
                isSheetVisible = true
            }
            .font(.system(size: 18))
            .fontWeight(.semibold)
            .padding()
            .frame(width: UIScreen.main.bounds.width - 32)
            .foregroundColor(Color("Primary"))
            .background(.white)
            .cornerRadius(8)
            .sheet(isPresented: $isSheetVisible) {
                VStack(spacing: .none){
                    Text("How often should I bug you?")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .bold()
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(Color("Primary"))
                    
                    Picker("Time", selection: $selectedTime) {
                        ForEach(times, id: \.self) {
                            Text($0)
                                .fontWeight(.medium)
                                .foregroundColor(Color("Secondary"))
                            
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(height: 120)
                    .scaleEffect(1.1)
                    .padding(.bottom, -5)
                    .padding(.top, -17)
                    
                    Button("Start!"){
                        isSheetVisible = false
//                        hasStarted = true
                    }
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 32)
                    .background(Color("Primary"))
                    .cornerRadius(8)
                    
                }
                .presentationDetents([.height(260)])
            }
            
            NavigationLink("Stretch Now"){
                StretchPage()
            }
            .font(.system(size: 18))
            .fontWeight(.semibold)
            .padding()
            .frame(width: UIScreen.main.bounds.width - 32)
            .foregroundColor(Color("Primary"))
            .background(.white)
            .cornerRadius(8)
        }
    }
}


struct OnboardPage_Previews: PreviewProvider {
    static var previews: some View {
        OnboardPage()
    }
}
