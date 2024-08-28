//
//  mainButton.swift
//  lumiu
//
//  Created by Lucasz on 2024/7/21.
//

import SwiftUI

struct mainButton: View {
    let text : String
    let buttonColor : Color
    let textColor : Color
    var action : () -> ()
    init(text: String,buttonColor: Color = .accentColor,textColor: Color = .white,action :@escaping () -> ()) {
        self.text = text
        self.action = action
        self.buttonColor = buttonColor
        self.textColor = textColor
    }
    var body: some View {
        Button{
            action()
        }label: {
            Text(text)
                .font(.system(size: 24,weight: .medium,design: .default))
                .foregroundStyle(textColor)
                .padding(.all)
                .padding(.vertical,12)
                .frame(maxWidth: .infinity,alignment: .center)
                .background(buttonColor)
                .clipShape(RoundedRectangle(cornerRadius: 24,style: .continuous))
        }
    }
}

#Preview {
    mainButton(text: "good boy",buttonColor:.accentColor,textColor: .white,action: {})
}

