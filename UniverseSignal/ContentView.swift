//
//  ContentView.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/8/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm : loginManager = .init()
    var body: some View {
        if vm.islogin{
            mainView()
        }else{
            loginView()
                .environmentObject(vm)
        }
    }
}

#Preview {
    ContentView()
}
