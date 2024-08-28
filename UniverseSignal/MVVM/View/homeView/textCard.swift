//
//  textCard.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/8/23.
//

import SwiftUI

struct textCard: View {
    var cover : String
    var title : String
    var author : String
    var pubTime : String
    var body: some View {
        VStack(alignment:.leading,spacing:16){
            HStack(alignment: .top, spacing: 24){
                highLightText(text: title, highlightColor: .red)
                    .font(.system(size: 16,weight: .bold))
                    .opacity(0.8)
                    .frame(maxWidth: .infinity)
                Image(cover)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160,height: 90)
                    .clipped()
            }
            HStack(spacing:16){
                Rectangle()
                    .frame(width: 200,height: 1)
                    .opacity(0.2)
                highLightText(text:"\(pubTime) · \(author)",highlightColor: .red)
                    .font(.system(size: 12))
                    .opacity(0.6)
            }
        }
        .padding(.leading,20)
    }
}

#Preview {
    textCard(cover: "timg1", title: "有了 AI 后，「老番茄」都能陪我打王者了", author: "特工宇宙", pubTime: "1天前")
}
