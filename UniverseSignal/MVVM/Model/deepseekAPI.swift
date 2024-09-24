//
//  deepseekAPI.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/9/10.
//

import Foundation

// 定义一个结构体来表示消息
struct Message: Codable {
    var role = "user"
    let content: String
}


// 定义一个结构体来表示请求体
struct ChatRequest: Codable {
    let model: String
    let messages: [Message]
    let stream: Bool
}
