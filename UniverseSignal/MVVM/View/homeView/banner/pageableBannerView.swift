//
//  pageableBannerView.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/8/25.
//

import SwiftUI

struct pageableBannerView: View {
    //拖拽的偏移量
    @State var dragOffset : CGFloat = .zero
    //当前的位置索引
    @State var currentIndex : Int = 0
    //是否动画
//    @State var isAnimation : Bool = true
    let spacing : CGFloat = 16
    //banner
    var banners : [banner]
//    var banners : [banner] = [
//        banner( bannerImg: "testImg", bannerUrl: "null"),
//        banner( bannerImg: "testImg", bannerUrl: "null"),
//    ]
    
    var body: some View {
        let currentOffset = CGFloat(currentIndex) * CGFloat(300 + spacing)
        GeometryReader{ geometry in
            HStack(spacing: spacing){
                ForEach(banners) { banner in
                    bannerView(bannerImg: banner.bannerImg)
                }
            }
            .frame(width: geometry.size.width,height: geometry.size.height,alignment: .leading)
            .offset(x: dragOffset-currentOffset)
//            .offset( x: currentIndex == banners.count-1 ? dragOffset - currentOffset + spacing : dragOffset - currentOffset)
            .gesture(dragGesture)
        }
    }
    
    private var dragGesture : some Gesture {
        DragGesture()
            .onChanged{
//                isAnimation = true
                dragOffset = $0.translation.width
            }
            .onEnded{
                dragOffset = .zero
                if $0.translation.width > 50{
                    currentIndex -= 1
                }
                if $0.translation.width < -50{
                    currentIndex += 1
                }
                currentIndex = max(min(currentIndex, banners.count - 1),0)
            }
    }
    
}

#Preview {
    pageableBannerView(banners: [banner(bannerImg: "banner1", bannerUrl: ""),banner(bannerImg: "banner2", bannerUrl: ""),banner(bannerImg: "banner3", bannerUrl: "")])
}
