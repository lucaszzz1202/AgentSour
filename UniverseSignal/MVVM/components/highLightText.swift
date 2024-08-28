//
//  highLightText.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/8/29.
//

import SwiftUI

struct highLightText: View {
    let text: String
    let highlightTexts: [String] = [
        // 英文标点符号
        ",", ".", "!", "?", ";", ":", "-", "(", ")", "[", "]", "{", "}", "'", "\"", "/", "\\", "|", "`", "~", "@", "#", "$", "%", "^", "&", "*", "_", "+", "=", "<", ">",
        
        // 中文标点符号
        "，", "。", "！", "？", "；", "：", "—", "（", "）", "【", "】", "｛", "｝", "‘", "’", "“", "”", "、", "《", "》", "……", "——", "·", "～", "￥", "％", "＃", "＠", "＆", "＊", "＿", "＋", "＝", "＜", "＞","「","」"
    ]
    let highlightColor: Color

    var body: some View {
        var currentIndex = text.startIndex
        var result = Text("")

        for highlightText in highlightTexts {
            if let range = text.range(of: highlightText, range: currentIndex..<text.endIndex) {
                let lowerBound = text.distance(from: text.startIndex, to: range.lowerBound)
                let upperBound = text.distance(from: text.startIndex, to: range.upperBound)

                result = result + Text(text[currentIndex..<text.index(text.startIndex, offsetBy: lowerBound)])
                result = result + Text(highlightText)
                    .foregroundColor(highlightColor)
                
                currentIndex = text.index(text.startIndex, offsetBy: upperBound)
            }
        }

        result = result + Text(text[currentIndex...])
        return result
    }
}

#Preview {
    highLightText(text: "Hello, World! This is a test.", highlightColor: .red)
}
