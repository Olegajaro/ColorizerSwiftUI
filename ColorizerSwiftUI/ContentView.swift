//
//  ContentView.swift
//  ColorizerSwiftUI
//
//  Created by Олег Федоров on 29.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var redValue = Double.random(in: 1...255)
    @State var greenValue = Double.random(in: 1...255)
    @State var blueValue = Double.random(in: 1...255)
    @FocusState var focused: Bool
    
    var body: some View {
        ZStack {
            Color(white: 0.8)
                .ignoresSafeArea()
            
            VStack(spacing: 60) {
                ColorView(
                    redComponent: redValue,
                    greenComponent: greenValue,
                    blueComponent: blueValue
                )
                
                VStack {
                    ColorSliderView(sliderValue: $redValue, color: .red)
                    ColorSliderView(sliderValue: $greenValue, color: .green)
                    ColorSliderView(sliderValue: $blueValue, color: .blue)
                }
                .focused($focused)
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        HStack {
                            Spacer()
                            Button("Done") {
                                focused = false
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    
    @Binding var sliderValue: Double
    let color: Color
    
    
    var body: some View {
        HStack(spacing: 8) {
            Text("\(lround(sliderValue))")
                .multilineTextAlignment(.leading)
                .frame(width: 50)
            Slider(value: $sliderValue, in: 1...255, step: 1)
                .tint(color)
            TextFieldView(string: "\(lround(sliderValue))")
        }
        
    }
}
