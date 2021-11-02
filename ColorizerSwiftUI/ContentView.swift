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

    @FocusState private var isOnFocus: Bool
    
    var body: some View {
//        NavigationView {
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
                        SliderView(sliderValue: $redValue,
                                   color: .red)
                        SliderView(sliderValue: $greenValue,
                                   color: .green)
                        SliderView(sliderValue: $blueValue,
                                   color: .blue)
                    }
                    .focused($isOnFocus)
                    .frame(height: 150)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                isOnFocus = false
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .onTapGesture {
                isOnFocus = false
            }
        }
        
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

