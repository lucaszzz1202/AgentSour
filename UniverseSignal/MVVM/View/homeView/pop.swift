//
//  pop.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/9/10.
//

import SwiftUI

// 定义一个打字指示器视图
struct pop : View {
    let text: String
    
    var body: some View {
        parseMarkdown(text)
            .font(.system(size: 16))
            .opacity(0.8)
            .lineSpacing(8)
            .lineLimit(nil)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(10)
//        Text(text)
//            .font(.system(size: 16))
//            .opacity(0.8)
//            .lineLimit(nil)
//            .frame(maxWidth: .infinity, alignment: .topLeading)
//            .padding(10)
    }
}

#Preview {
    pop(text:"""
            南京以其美味的鸭子而闻名，以下是一些在南京非常受欢迎的鸭子店：\n\n1. **韩复兴**：这家店以其盐水鸭和板鸭而著名，是南京的老字号，历史悠久，深受当地人和游客的喜爱。\n\n2. **章云板鸭**：这家店的烤鸭和盐水鸭都非常有名，尤其是其独特的烤鸭皮脆肉嫩，味道鲜美。\n\n3. **金宏兴鸭子店**：这家店的烤鸭和盐水鸭也备受好评，尤其是其烤鸭的香味和口感，让人回味无穷。\n\n4. **陈家鸭子店**：这家店的鸭子以其独特的腌制和烤制工艺而闻名，味道独特，深受食客喜爱。\n\n5. **陆家鸭子店**：这家店的鸭子以其肉质鲜嫩、味道醇厚而受到好评，尤其是其盐水鸭，口感极佳。\n\n6. **张记鸭子店**：这家店的鸭子以其独特的烤制工艺和调味料而闻名，味道鲜美，深受食客喜爱。\n\n这些店铺大多位于南京的老城区，如夫子庙、新街口等地，交通便利，游客可以轻松找到。在南京，品尝鸭子不仅是美食体验，更是一种文化体验。
            """)
}
