//
//  MasterView.swift
//  Baduuut
//
//  Created by Jevon Levin on 21/03/23.
//

import SwiftUI

struct MasterView<Content: View>: View {
    
    var title: String
    var subtitle: String
    @Binding private var isTimerVisible: Bool
    @Binding private var timeRemaining: Int
    var lottieFileName: String?
    var content: Content
    
    init(title: String, subtitle: String, isTimerVisible: Binding<Bool> = .constant(false), timeRemaining: Binding<Int> = .constant(0), lottieFileName: String? = nil, @ViewBuilder contentBuilder: () -> Content) {
        self.title = title
        self.subtitle = subtitle
        self._isTimerVisible = isTimerVisible
        self._timeRemaining = timeRemaining
        self.lottieFileName = lottieFileName
        self.content = contentBuilder()
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Circle()
                    .foregroundColor(Color("Secondary"))
                    .frame(width: 685, height: 685)
                    .offset(y: -240) // Masih nembak, kalo di Sketch -137
                VStack (spacing: 0) {
                    
                    VStack(spacing: 0){
                        Text(title)
                            .fontWeight(.bold)
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                        Text(subtitle)
                            .font(.system(size: 18))
                            .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width - 32)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.top, 5)
                        Spacer()
                    }.frame(height: 140)
     
    //                Spacer()
                    
                    ZStack {
                        if isTimerVisible{
                            Text(String(format: "%02d", timeRemaining))
                            
                            .font(.system(size: 310, weight: .thin))
                                
                            .foregroundColor(.white)
                                
                            .offset(y: -50)
                            .padding(-50) // workaround supaya "container" si textnya gak overflow
                        }
                        VStack {
                            LottieView(lottieFile: lottieFileName ?? "dummy-2")
                                .offset(y: 15)
                                .scaleEffect(1.7)
                        }
                    }
                    
                    
                    
                    VStack(spacing: .none){
                        Spacer()
                        content
                    }
                    .frame(width: UIScreen.main.bounds.width - 32)
                    
                }
                .padding()
            }
            .background(Color("Primary"))
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(title: "Blabla", subtitle: "blabla"){
            Text("asd")
        }
    }
}
