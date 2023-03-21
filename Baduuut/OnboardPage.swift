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
                
            }
            .font(.system(size: 18))
            .fontWeight(.semibold)
            .padding()
            .frame(width: UIScreen.main.bounds.width - 32)
            .foregroundColor(Color(red: 16/255, green: 38/255, blue: 67/255))
            .background(.white)
            .cornerRadius(8)
            
            NavigationLink("Stretch Now"){
                StretchPage()
            }
            .font(.system(size: 18))
            .fontWeight(.semibold)
            .padding()
            .frame(width: UIScreen.main.bounds.width - 32)
            .foregroundColor(Color(red: 16/255, green: 38/255, blue: 67/255))
            .background(.white)
            .cornerRadius(8)
        }
    }
}
//VStack(spacing: .none){
//    Text("How often should I bug you?")
//        .multilineTextAlignment(.center)
//        .font(.title2)
//        .bold()
//        .fixedSize(horizontal: false, vertical: true)
//        .foregroundColor(.white)
//
//    Picker("Time", selection: $selectedTime) {
//        ForEach(times, id: \.self) {
//            Text($0)
//                .fontWeight(.medium)
//                .foregroundColor(Color(red: 224/255, green: 152/255, blue: 56/255))
//
//        }
//    }
//    .pickerStyle(.wheel)
//    .frame(height: 120)
//    .scaleEffect(1.1)
//    .padding(.bottom, -5)
//    .padding(.top, -17)
//
//    Button("Start!"){
//        withAnimation{
//            hasStarted = true
//        }
//    }
//    .foregroundColor(Color(red: 16/255, green: 38/255, blue: 67/255))
//    .fontWeight(.semibold)
//    .padding()
//    .frame(width: UIScreen.main.bounds.width - 32)
//    .background(.white)
//    .cornerRadius(8)
//
//}
//.frame(width: UIScreen.main.bounds.width - 32)
//

struct OnboardPage_Previews: PreviewProvider {
    static var previews: some View {
        OnboardPage()
    }
}
