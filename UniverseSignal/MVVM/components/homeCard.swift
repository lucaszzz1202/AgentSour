//
//  homeCard.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/8/23.
//

import SwiftUI
import UIKit

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        UIVisualEffectView()
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = effect
    }
}

struct homeCard: View {
    var body: some View {
        Image("testImg")
            .resizable()
            .scaledToFill()
            .frame(width: .infinity,height: 240)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.16), radius: 2, x: 0, y: 4)
            .overlay(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 8){
                    Text("Hiking")
                        .font(.system(size: 16,weight: .semibold))
                    HStack{
                        HStack{
                            Image("logo")
                                .resizable()
                                .frame(width: 20,height: 20)
                                .clipShape(Circle())
                            Text("@theShy")
                                .font(.system(size: 14))
                        }
                        Spacer()
                        Text("1天前")
                            .font(.system(size: 14))
                            .opacity(0.6)
                    }
                }
                .padding(.all,16)
                .background(
                    ZStack{
                        backBlur(effect: UIBlurEffect(style: .light))
                        LinearGradient(
                        stops: [
                        Gradient.Stop(color: .white.opacity(0), location: 0.00),
                        Gradient.Stop(color: .white.opacity(0.8), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 1)
                        )
                    }

                )
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
    }
}

#Preview {
    homeCard()
}
