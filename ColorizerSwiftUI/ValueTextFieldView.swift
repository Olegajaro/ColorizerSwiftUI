//
//  ValueTextFieldView.swift
//  ColorizerSwiftUI
//
//  Created by Олег Федоров on 02.11.2021.
//

import SwiftUI

struct ValueTextFieldView: View {
    
    @Binding var textValue: String
    @Binding var value: Double
    
    @State private var showAlert = false
    
    var body: some View {
        DecimalTextField(text: $textValue)
            .frame(width: 60, height: 28, alignment: .trailing)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.decimalPad)
            .onChange(of: textValue) { newValue in
                withAnimation(.linear) {
                    check(newValue)
                }
            }
            .alert("Wrong Format", isPresented: $showAlert, actions: {}) {
                Text("Please enter value from 0 to 255")
            }
    }
    
    private func check(_ text: String) {
        if let value = Int(text), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        value = 0
        textValue = "0"
    }
}

struct ValueTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ValueTextFieldView(textValue: .constant("100"),
                               value: .constant(100))
        }
    }
}
