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
    
    @State private var hasAppear = false
    
    init(title: String, subtitle: String, isTimerVisible: Binding<Bool> = .constant(false), timeRemaining: Binding<Int> = .constant(0), lottieFileName: String? = nil, @ViewBuilder contentBuilder: () -> Content) {
        self.title = title
        self.subtitle = subtitle
        self._isTimerVisible = isTimerVisible
        self._timeRemaining = timeRemaining
        self.lottieFileName = lottieFileName
        self.content = contentBuilder()
    }
    
    var body: some View {
        
        NavigationStack {
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
                    
                    ZStack(alignment: .top) {
                        if isTimerVisible{
                            Text(String(format: "%02d", timeRemaining))
                            
                                .font(.system(size: 310, weight: .thin))
                            
                                .foregroundColor(.white)
                            
                                .offset(y: -50)
                                .padding(-50) // workaround supaya "container" si textnya gak overflow
                        }
                        
                        if(hasAppear){
                            LottieView(lottieFile: lottieFileName ?? "body-shake")
                                .offset(y: 20)
                                .scaleEffect(1.8)
                        } else {
                            // todo: kasih placeholder pas lottie nya masih ngeload
                            Image("placeholder")
                                .offset(x: 15, y: 20)
                                .scaleEffect(1.3)
                                .padding(-50)
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
            .background(LinearGradient(colors: [Color("Primary"), Color("LightBlue")],
                                       startPoint: .bottom,
                                       endPoint: .center))
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.hasAppear = true
            }
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(title: "Blabla", subtitle: "blabla", isTimerVisible: .constant(true)){
            Text("")
        }
    }
}
