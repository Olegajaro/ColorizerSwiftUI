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
    @State var redTFValue = 23.0
    @State var greenTFValue = 78.0
    @State var blueTFValue = 123.0
    
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
                        textFieldValue: $redTFValue,
                        color: .red
                    )
                    ColorSliderView(
                        sliderValue: $greenValue,
                        textFieldValue: $greenTFValue,
                        color: .green
                    )
                    ColorSliderView(
                        sliderValue: $blueValue,
                        textFieldValue: $blueTFValue,
                        color: .blue
                    )
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
            .padding(
                EdgeInsets(top: 60, leading: 16, bottom: 16, trailing: 16)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    
//    @Binding var textSliderValue: Double
    @Binding var sliderValue: Double
    @Binding var textFieldValue: Double
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
            TextField("", value: $textFieldValue, format: .number)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .multilineTextAlignment(.trailing)
                .keyboardType(.numberPad)
        }
    }
}

//"\(lround(sliderValue))"

