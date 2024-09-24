//
//  chatViewModel.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/9/10.
//

import Foundation
import SwiftUI

// 定义一个视图模型来管理对话
class ChatViewModel: ObservableObject {
    @Published var currentResponse: String = ""
    @Published var currentMessage: String = ""
    @Published var lastSentMessage: String? = nil
    
    func sendMessage() {
        let newMessage = Message(content: currentMessage)
        lastSentMessage = currentMessage
        currentMessage = ""
        currentResponse = ""
        
        Task {
            do {
                try await streamResponse(messages: [newMessage])
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func streamResponse(messages: [Message]) async throws {
        let url = URL(string: "https://api.deepseek.com/chat/completions")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(DeepSeekAPI().key)", forHTTPHeaderField: "Authorization")
        
        let chatRequest = ChatRequest(model: "deepseek-chat", messages: messages, stream: true)
        request.httpBody = try! JSONEncoder().encode(chatRequest)
        
        let (asyncBytes, response) = try await URLSession.shared.bytes(for: request)
        
        for try await line in asyncBytes.lines {
            if line.hasPrefix("data: ") {
                let jsonString = line.dropFirst(6)
                if let data = jsonString.data(using: .utf8),
                   let json = try? JSONSerialization.jsonObject(with: data, options: []),
                   let dict = json as? [String: Any],
                   let choices = dict["choices"] as? [[String: Any]],
                   let delta = choices.first?["delta"] as? [String: Any],
                   let content = delta["content"] as? String {
                    DispatchQueue.main.async {
                        withAnimation{
                            self.currentResponse += content
                        }
                    }
                }
            }
        }
    }
}
