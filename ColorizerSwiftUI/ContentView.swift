//
//  ContentView.swift
//  ColorizerSwiftUI
//
//  Created by Олег Федоров on 29.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var redValue = 23.0
    @State var greenValue = 78.0
    @State var blueValue = 123.0
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
                    ColorSliderView(
                        sliderValue: $redValue,
                        color: .red
                    )
                    ColorSliderView(
                        sliderValue: $greenValue,
                        color: .green
                    )
                    ColorSliderView(
                        sliderValue: $blueValue,
                        color: .blue
                    )
                }
                
                Spacer()
            }
            .padding(
                EdgeInsets(top: 60, leading: 16, bottom: 16, trailing: 16)
            )
            .focused($focused)
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button("Done", action: doneAction)
                    }
                }
            }
        }
    }
    
    private func doneAction() {
        focused = false
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
                .frame(width: 50)
            Slider(
                value: $sliderValue,
                in: 1...255,
                step: 1
                )
                .tint(color)
            TextField("", value: $sliderValue, format: .number)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .multilineTextAlignment(.trailing)
                .keyboardType(.numberPad)
        }
    }
}
