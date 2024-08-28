//
//  bannerView.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/8/25.
//

import SwiftUI

struct bannerView: View {
    var bannerImg : String
    
    var body: some View {
        VStack{
            Image(bannerImg)
                .resizable()
                .scaledToFill()
                .frame(width: 320, height: 320, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.black.opacity(0.1),lineWidth: 1)
                )
        }
    }
}

#Preview {
    bannerView(bannerImg: "banner1")
}
