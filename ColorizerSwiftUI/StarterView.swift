//
//  StarterView.swift
//  ColorizerSwiftUI
//
//  Created by Олег Федоров on 08.11.2021.
//

import SwiftUI

struct StarterView: View {
    
    @State private var swiftUIViewIsPresented = false
    @State private var uiKitViewIsPresented = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("SwiftUIView") {
                swiftUIViewIsPresented = true
            }
            .sheet(isPresented: $swiftUIViewIsPresented) {
                ContentView()
            }
            
            Button("UIKitView") {
                uiKitViewIsPresented = true
            }
            .sheet(isPresented: $uiKitViewIsPresented) {
                ColorViewControllerRepresentable()
                    .ignoresSafeArea()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
