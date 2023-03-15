//
//  SwiftUI_CryptoApp.swift
//  SwiftUI-Crypto
//
//  Created by Thien Vu Le on Mar/14/23.
//

import SwiftUI

@main
struct SwiftUI_CryptoApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(vm)
        }
    }
}
