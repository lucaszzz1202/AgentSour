//
//  backBlur.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/8/27.
//

import SwiftUI

struct backBlur: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        UIVisualEffectView()
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = effect
    }
}

#Preview {
    backBlur()
}
