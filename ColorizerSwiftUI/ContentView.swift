//
//  ContentView.swift
//  ColorizerSwiftUI
//
//  Created by Олег Федоров on 29.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue = 23.0
    @State private var greenValue = 78.0
    @State private var blueValue = 123.0
    
    @State private var redTF = 0.0
    @State private var greenTF = 0.0
    @State private var blueTF = 0.0
    
    @State private var alertPresented = false
    
    @FocusState private var focused: Bool
    
    var body: some View {
        ZStack {
            Color(white: 0.8)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                ColorView(
                    redComponent: redValue,
                    greenComponent: greenValue,
                    blueComponent: blueValue
                )
                    .padding(.top)
                
                VStack {
                    SliderView(sliderValue: $redValue,
                               textSV: $redValue,
                               color: .red)
                    SliderView(sliderValue: $greenValue,
                               textSV: $greenValue,
                               color: .green)
                    SliderView(sliderValue: $blueValue,
                               textSV: $blueValue,
                               color: .blue)
                }
                
                Spacer()
            }
            .focused($focused)
            .toolbar {
                ToolbarItem(id: "",
                            placement: .keyboard,
                            showsByDefault: false) {
                    Button("Done", action: doneAction)
                        .alert("Wrong Format",
                               isPresented: $alertPresented,
                               actions: {})
                }
            }
        }
    }
    
    private func doneAction() {
        
        if redTF < 0 && redTF > 255 {
            redTF = 1
            alertPresented = true
            return
        }
        
        redTF = redValue
        focused = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

