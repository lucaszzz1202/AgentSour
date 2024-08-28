//
//  homeView.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/8/22.
//

import SwiftUI

struct homeView: View {
    @State private var isPressing = false
    @State var showAskSour : Bool = false
    var banners = [
        banner( bannerImg: "banner1", bannerUrl: "null"),
        banner( bannerImg: "banner2", bannerUrl: "null"),
        banner( bannerImg: "banner3", bannerUrl: "null"),
    ]
    var texts = [
        textInfo(cover: "timg1", title: "有了 AI 后，「老番茄」都能陪我打王者了", author: "特工宇宙", pubTime: "2天前"),
        textInfo(cover: "timg2", title: "对话道哥（吴翰清）：从不做竞品分析，致力于做 AI 时代的「探索引擎」", author: "特工宇宙", pubTime: "3天前"),
        textInfo(cover: "timg3", title: "AgentMarket，一款来自清华的 AI 社交游戏", author: "特工宇宙", pubTime: "2天前"),
        textInfo(cover: "timg1", title: "有了 AI 后，「老番茄」都能陪我打王者了", author: "特工宇宙", pubTime: "2天前"),
        textInfo(cover: "timg2", title: "对话道哥（吴翰清）：从不做竞品分析，致力于做 AI 时代的「探索引擎」", author: "特工宇宙", pubTime: "3天前"),
        textInfo(cover: "timg3", title: "AgentMarket，一款来自清华的 AI 社交游戏", author: "特工宇宙", pubTime: "2天前")
    ]
    var body: some View {
        VStack{
            Text("Agent Sour")
                .font(.system(size: 20,weight: .bold))
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    ad
                        .padding(20)
                    Spacer()
                        .frame(height: 20)
                    news
                }
            }
//            .overlay(alignment: .top) {
//                Rectangle()
//                    .frame(height: 1)
//                    .opacity(0.1)
//            }
            .overlay(alignment: .bottom) {
                VStack(alignment: .leading,spacing: 8){
                    Text("问问 Sour")
                        .font(.system(size: 14))
                    HStack{
                        Text("我想知道...")
                            .font(.system(size: 16))
                            .opacity(0.4)

                        Spacer()
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32,height: 32)
                            .clipShape(Circle())
                    }
                }
                .padding(16)
                .frame(width: 360,height: 120,alignment: .topLeading)
                .background(
                    ZStack{
                        backBlur(effect: UIBlurEffect(style: .light))
                        Color.white.opacity(isPressing ? 0.2 : 0.8)
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 16))
                
                .gesture(
                    DragGesture(minimumDistance: 0,coordinateSpace: .local)
                        .onChanged({ value in
                            if value.location.y >= 0 {
                                isPressing = true
                            }
                            if value.location.y < 0{
                                isPressing = false
                            }
                })
                        .onEnded({ value in
                            if value.location.y >= 0 {
                                isPressing = false
                                showAskSour = true
                            }

                        })
                )
            }
        }
        .sheet(isPresented: $showAskSour){
            AskSour()
        }
    }
    
    var welcome : some View {
        Text("晚上好，Lux。\n今天是 2024 年 08 月 23 日 星期五。")
            .multilineTextAlignment(.center)
            .padding(.top,20)
            .padding(.horizontal,20)
    }
    
    var ad : some View {
        VStack{
            pageableBannerView(banners: banners)
        }
        .frame(height: 320)
    }
    
    var news : some View {
        VStack(alignment: .center,spacing: 20){
//            HStack(spacing:20){
//                Rectangle()
//                    .frame(width: 40,height: 1)
//                    .opacity(0.1)
////                Text("10  for  Today")
////                    .font(.system(size: 14,weight: .thin))
//                Rectangle()
//                    .frame(width: 40,height: 1)
//                    .opacity(0.1)
//            }

            VStack(spacing:40){
                ForEach(texts){ card in
                    textCard(cover: card.cover, title: card.title, author: card.author, pubTime: card.pubTime)
                }
            }
        }
    }
}

#Preview {
    mainView()
}
