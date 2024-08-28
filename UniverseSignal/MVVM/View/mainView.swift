//
//  mainView.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/8/23.
//

import SwiftUI

struct mainView: View {
    @StateObject var vm : mainViewModel = mainViewModel()
    var body: some View {
        ZStack{
            if vm.tabbarStatus == .homeView {
                homeView()
            }
            if vm.tabbarStatus == .hrView {
                hrView()
            }
            if vm.tabbarStatus == .chatView {
                chatView()
            }
            if vm.tabbarStatus == .meView {
                meView()
            }
            mainTabbar()
                .environmentObject(vm)

        }
        .background(.accent)
    }
}

#Preview {
    mainView()
}
