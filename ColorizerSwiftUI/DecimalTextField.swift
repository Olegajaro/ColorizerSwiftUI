//
//  DecimalTextField.swift
//  ColorizerSwiftUI
//
//  Created by Олег Федоров on 08.11.2021.
//

import SwiftUI

struct DecimalTextField: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextField {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        textField.borderStyle = .roundedRect
        textField.textAlignment = .right
        textField.inputAccessoryView = toolbar
        
        textField.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didTapDone),
            for: .editingDidEnd
        )
        
        let doneButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: textField,
            action: #selector(textField.resignFirstResponder)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        toolbar.items = [flexBarButton, doneButton]
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }
}

extension DecimalTextField {
    class Coordinator: NSObject {
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        @objc func didTapDone(_ sender: UITextField) {
            text = sender.text ?? ""
        }
    }
}

struct DecimalTextField_Previews: PreviewProvider {
    static var previews: some View {
        DecimalTextField(text: .constant("100"))
    }
}
