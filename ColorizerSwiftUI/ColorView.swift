//
//  ColorView.swift
//  ColorizerSwiftUI
//
//  Created by Олег Федоров on 29.10.2021.
//

import SwiftUI

struct ColorView: View {
    
    let redComponent: Double
    let greenComponent: Double
    let blueComponent: Double
    
    var body: some View {
        Rectangle()
            .foregroundColor(
                Color(red: redComponent / 255,
                      green: greenComponent / 255,
                      blue: blueComponent / 255)
            )
            .frame(height: 150)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 5)
            )
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(redComponent: 1, greenComponent: 255, blueComponent: 1)
    }
}
