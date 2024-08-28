//
//  loginManager.swift
//  UniverseSignal
//
//  Created by Lucasz on 2024/8/22.
//

import Foundation

class loginManager : ObservableObject {
    @Published var islogin : Bool = false
}

extension loginManager{
    func userlogin() {
        islogin = true
    }
}
