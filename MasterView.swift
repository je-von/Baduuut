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
    var lottieFileName: String?
    var content: Content
    
    init(title: String, subtitle: String, lottieFileName: String? = nil, @ViewBuilder contentBuilder: () -> Content) {
        self.title = title
        self.subtitle = subtitle
        self.lottieFileName = lottieFileName
        self.content = contentBuilder()
    }
    
    var body: some View {
        
        ZStack {
            Circle()
                .foregroundColor(Color(red: 224/255, green: 152/255, blue: 56/255))
                .frame(width: 685, height: 685)
                .offset(y: -250) // Masih nembak, kalo di Sketch -137
            VStack (spacing: 0) {
                
                VStack(spacing: 0){
                    Text("title")
                        .fontWeight(.bold)
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                    Text("sub")
                        .font(.system(size: 18))
                        .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width - 32)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.top, 5)
                    Spacer()
                }.frame(height: 140)
 
                Spacer()
                
                LottieView(lottieFile: lottieFileName ?? "dummy-2")
                    .offset(y: 15)
                    .scaleEffect(1.6)
                
                
                VStack(spacing: .none){
                    Spacer()
                    content
                }
                .frame(width: UIScreen.main.bounds.width - 32)
                
            }
            .padding()
        }
        .background(Color(red: 16/255, green: 38/255, blue: 67/255))
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(title: "Blabla", subtitle: "blabla"){
            Text("asd")
        }
    }
}
