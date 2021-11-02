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
        TextField("", text: $textValue) { _ in
            checkValue()
        }
        .frame(width: 50)
        .multilineTextAlignment(.trailing)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.decimalPad)
        .alert("Wrong Format", isPresented: $showAlert, actions: {}) {
            Text("Please enter value from 0 to 255")
        }
    }
    
    private func checkValue() {
        if let value = Int(textValue), (0...255).contains(value) {
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
