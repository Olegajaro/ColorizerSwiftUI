//
//  SliderView.swift
//  ColorizerSwiftUI
//
//  Created by Олег Федоров on 31.10.2021.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
    @State private var textValue = ""
    
    let color: Color
    
    var body: some View {
        HStack(spacing: 8) {
            ValueTextView(value: sliderValue)
                
            Slider(value: $sliderValue, in: 1...255, step: 1)
                .tint(color)
                .onChange(of: sliderValue) { isOnFocus in
                    textValue = "\(lround(isOnFocus))"
                }
            
            ValueTextFieldView(textValue: $textValue, value: $sliderValue)
        }
        .onAppear {
            textValue = "\(lround(sliderValue))"
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            SliderView(sliderValue: .constant(100),
                       color: .blue)
        }
    }
}
