//
//  loginView.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/8/22.
//

import SwiftUI

struct loginView: View {
    @EnvironmentObject var vm : loginManager
    var body: some View {
        VStack{
            Spacer()
            //logo&slogen
            VStack(spacing: 20){
                Image("logo_yzdb")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                Text("这 里 有 你 想 要 的 一 切")
                    .opacity(0.8)
            }
            Spacer()
            //登录
            mainButton(text: "登录/注册", buttonColor: .black, textColor: .white) {
                vm.userlogin()
            }
            
        }
        .padding(.all,20)
    }
}

#Preview {
    loginView()
        .environmentObject(loginManager())
}
