//
//  adCard.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/8/24.
//

import SwiftUI

struct adCard: View {
    var body: some View {
        VStack(alignment: .leading,spacing:4){
            Text("专访")
                .font(.system(size: 14,weight: .medium))
            Text("构建人与 AI 共生的宇宙")
                .font(.system(size: 20,weight: .bold))
                .frame(width: 140, alignment: .topLeading)
            Text("陶芳波")
                .font(.system(size: 16,weight: .medium))
        }
        .foregroundStyle(.white)
        .padding(.horizontal,24)
        .padding(.vertical,20)
        .frame(width: 320,height: 120,alignment: .leading)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .overlay(alignment: .bottom) {
            Image("ADcover")
                .resizable()
                .scaledToFit()
                .frame(height: 160)
        }
    }
}

#Preview {
    adCard()
}
