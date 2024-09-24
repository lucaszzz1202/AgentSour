//
//  MessageBub.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/9/10.
//

import SwiftUI

struct MessageBub: View {
    let message: Message
    
    var body: some View {
//        HStack {
//            if message.role == "user" {
//                Spacer()
//            }
            Text(message.content)
            .font(.system(size: 32,weight: .medium))
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(10)
//            if message.role != "user" {
//                Spacer()
//            }
//        }
    }
}

#Preview {
    MessageBub(message: .init(content: "hh"))
}
