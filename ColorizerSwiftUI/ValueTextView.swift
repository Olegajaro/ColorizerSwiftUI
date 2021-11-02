//
//  ValueTextView.swift
//  ColorizerSwiftUI
//
//  Created by Олег Федоров on 02.11.2021.
//

import SwiftUI

struct ValueTextView: View {
    
    let value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .frame(width: 40, alignment: .leading)
            .foregroundColor(.white)
    }
}

struct ValueTextView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.gray
            ValueTextView(value: 100)
        }
    }
}
