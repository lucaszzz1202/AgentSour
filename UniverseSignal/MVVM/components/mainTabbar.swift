//
//  mainTabbar.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/8/23.
//

import SwiftUI

struct mainTabbar: View {
    @EnvironmentObject var vm : mainViewModel
    var body: some View {
        HStack(alignment: .center){
            ForEach(mainViewModel.tabbarStatus.allCases,id: \.self){ tabbar in
                let selected = tabbar == vm.tabbarStatus
                let tab = tabbar.tab
                Text(tab)
                    .font(.system(size: 16))
                    .foregroundStyle(.opacity(selected ? 0.8 : 0.4))
                    .frame(width:48)
                    .onTapGesture {
                        vm.tabbarStatus = tabbar
                    }
                if tabbar != .meView {
                    Spacer()
                }
            }
        }
        .padding(.horizontal,40)
        .padding(.top,20)
        .background(.accent)
        .overlay(alignment: .top, content: {
            Rectangle()
                .frame(height: 1)
                .opacity(0.2)
        })
//        .shadow(color: .black.opacity(0.08), radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: -2)
        .frame(maxHeight: .infinity,alignment: .bottom)
    }
}

#Preview {
    mainTabbar()
        .environmentObject(mainViewModel())
}
