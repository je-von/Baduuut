//
//  OnboardPage.swift
//  Baduuut
//
//  Created by Jevon Levin on 21/03/23.
//

import SwiftUI
import Lottie
import UserNotifications
struct OnboardPage: View {
    @State private var isSheetVisible = false
    //    @State private var hasStarted = false
    @State private var selectedTime = "Every 30 minutes"
    let times = ["Every 60 seconds", "Every 30 minutes", "Every 1 hour", "Every 2 hours"]
    let message: String = welcomeMessages.randomElement()!
    
    //timer
    @StateObject private var vm = ViewModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let time:Float = 1.0
    
    //set session / stop timer button
    @State private var buttonName = "Set Session"
    @State private var buttonColor: Color = Color(.white)
    @State private var buttonTextColor: Color = Color("Primary")
    
    var body: some View {
        MasterView(title: "Oh, hi 😒", subtitle: message){
            //
            //            Text("00:00:00")
            //                .fontWeight(.bold)
            //                .font(.system(size: 40))
            //                .foregroundColor(.white)
            
            VStack{
                Text("\(vm.time)")
                    .fontWeight(.bold)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }.onReceive(timer) {_ in
                vm.updateCountdown()
            }
            
            Text("until your next stretch")
                .font(.system(size: 18))
                .foregroundColor(.white)
                .padding(.bottom, 20)
            
            //fix: tulisannya, warna button?
            Button(buttonName){
                if vm.isActive {
                    vm.reset()
                    buttonName = "Set Session"
                    buttonColor = .white
                    buttonTextColor = Color("Primary")
                    
                    UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                } else {
                    isSheetVisible = true
                }
                
            }
            .font(.system(size: 18))
            .fontWeight(.semibold)
            .padding()
            .frame(width: UIScreen.main.bounds.width - 32)
            .foregroundColor(buttonTextColor)
            .background(buttonColor)
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
                        let seconds = vm.extractTime(selected: $selectedTime.wrappedValue)
                        vm.start(seconds: seconds)
                        //                        hasStarted = true
                        
                        buttonName = "Stop Timer"
                        buttonColor = Color("Danger")
                        buttonTextColor = Color(.white)
                        
                        let content = UNMutableNotificationContent()
                        content.title = "Time's up!"
                        content.subtitle = reminderMessages.randomElement()!
                        content.sound = UNNotificationSound.default
                        
                        // show this notification five seconds from now
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(seconds), repeats: true)
                        
                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: "BADUUUT_STRETCH_NOTIF_ID", content: content, trigger: trigger)
                        
                        // add our notification request
                        UNUserNotificationCenter.current().add(request)
                        
                        
                        print("masuk")
                        
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
