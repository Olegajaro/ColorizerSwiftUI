//
//  TextFieldView.swift
//  ColorizerSwiftUI
//
//  Created by Олег Федоров on 29.10.2021.
//

import SwiftUI

struct TextFieldView: View {
    
    let string: String
    
    var body: some View {
        TextField("", text: .constant(string))
            .textFieldStyle(.roundedBorder)
            .frame(width: 50)
            .multilineTextAlignment(.trailing)
            .keyboardType(.numberPad)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(string: "")
    }
}
