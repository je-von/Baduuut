//
//  ContentView.swift
//  Baduuut
//
//  Created by Leo Harnadi on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    var body: some View {
        //        StretchPage()
        OnboardPage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
