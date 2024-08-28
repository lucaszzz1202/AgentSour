//
//  mainViewModel.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/8/23.
//

import Foundation

class mainViewModel : ObservableObject {
    enum tabbarStatus : CaseIterable {
        case homeView
        case hrView
        case chatView
        case meView
        
        var tab : String{
            switch self{
            case.homeView : return "首页"
            case.hrView : return "招聘"
            case.chatView : return "消息"
            case.meView : return "我"
            }
        }
    }
    
    @Published var tabbarStatus : tabbarStatus = .homeView
    
}
