//
//  AskSour.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/8/27.
//

import SwiftUI

struct AskSour: View {
    @FocusState private var isTextFieldFocused : Bool 
    var body: some View {
            VStack(alignment: .center ){
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 80,height: 4)
                    .opacity(0.4)
                    .padding(16)
                Text("问问 Sour")
                    .font(.system(size: 14))
                Spacer()
                HStack(alignment: .center){
                    TextField("我想知道...",text: .constant(""))
                        .focused($isTextFieldFocused)
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32,height: 32)
                        .clipShape(Circle())
                }
                .padding(16)
                .background(.white)
            }
            .background(.accent)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()){
                    isTextFieldFocused = true
                }
            }
    }
}

#Preview {
    mainView()
}
