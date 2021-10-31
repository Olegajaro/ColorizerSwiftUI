//
//  SliderView.swift
//  ColorizerSwiftUI
//
//  Created by Олег Федоров on 31.10.2021.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
    @Binding var textSV: Double
    let color: Color
    
    var body: some View {
        HStack(spacing: 8) {
            Text("\(lround(sliderValue))")
                .frame(width: 45)
                
            Slider(
                value: $sliderValue,
                in: 1...255,
                step: 1
            )
                .tint(color)
            
            TextField("", value: $textSV, format: .number)
                .textFieldStyle(.roundedBorder)
                .frame(width: 45)
                .multilineTextAlignment(.trailing)
                .keyboardType(.numberPad)
        }
        .padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(100),
                   textSV: .constant(100),
                   color: .blue)
    }
}
