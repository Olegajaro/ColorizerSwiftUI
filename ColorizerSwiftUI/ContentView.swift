//
//  ContentView.swift
//  ColorizerSwiftUI
//
//  Created by Олег Федоров on 29.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue = Double.random(in: 0...255)
    @State private var blueValue = Double.random(in: 0...255)
    @State private var greenValue = Double.random(in: 0...255)
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        ZStack {
            Color(white: 0.6)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                ColorView(
                    redComponent: redValue,
                    greenComponent: greenValue,
                    blueComponent: blueValue
                )
                    .padding(.top)
                
                VStack {
                    SliderView(sliderValue: $redValue, color: .red)
                        .focused($focusedField, equals: .red)
                    SliderView(sliderValue: $greenValue, color: .green)
                        .focused($focusedField, equals: .green)
                    SliderView(sliderValue: $blueValue, color: .blue)
                        .focused($focusedField, equals: .blue)
                }
                .frame(height: 150)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button(action: previousField) {
                            Image(systemName: "chevron.up")
                        }
                        Button(action: nextField) {
                            Image(systemName: "chevron.down")
                        }
                        Spacer()
                        Button("Done") {
                            focusedField = nil
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .onTapGesture {
            focusedField = nil
        }
    }
}

extension ContentView {
    enum Field {
        case red
        case green
        case blue
    }
    
    private func nextField() {
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        case .blue:
            focusedField = .red
        default:
            focusedField = nil
        }
    }
    
    private func previousField() {
        switch focusedField {
        case .red:
            focusedField = .blue
        case .green:
            focusedField = .red
        case .blue:
            focusedField = .green
        default:
            focusedField = nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

