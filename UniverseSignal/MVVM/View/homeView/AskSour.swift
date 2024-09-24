//
//  AskSour.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/8/27.
//

import SwiftUI
import Foundation


struct AskSour: View {
    @StateObject var viewModel = ChatViewModel()
    @FocusState private var isTextFieldFocused : Bool
    
    var body: some View {
            VStack(alignment: .center ){
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 80,height: 4)
                    .opacity(0.4)
                    .padding(16)
                HStack{
                    Image("搜索_search")
                    Text("问问 Sour")
                        .font(.system(size: 14))
                }

                ScrollView {
                    VStack(spacing: 10) {
                        if let lastMessage = viewModel.lastSentMessage {
                            MessageBub(message: Message(content: lastMessage))
                        }
                        if !viewModel.currentResponse.isEmpty {
                            pop(text: viewModel.currentResponse)
                                .transition(.opacity)
                                .animation(.default, value: viewModel.currentResponse)
                        }
                    }
                    .padding(20)
                }
                HStack(alignment: .center){
                    TextField("我想知道...",text: $viewModel.currentMessage)
                        .focused($isTextFieldFocused)
                    Spacer()
                    Button(action:{
                        viewModel.sendMessage()
                    } ){
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32,height: 32)
                            .clipShape(Circle())
                    }
                    .disabled(viewModel.currentMessage.isEmpty) // 当 textInput 为空时禁用按钮
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
