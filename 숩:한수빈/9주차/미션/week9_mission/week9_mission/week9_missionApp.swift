//
//  week9_missionApp.swift
//  week9_mission
//
//  Created by Subeen on 2023/11/28.
//

import SwiftUI

@main
struct week9_missionApp: App {
    
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            
//            if appState.autoLogin {  // 자동로그인했을 경우
//                ProfileView()
//                    .environmentObject(AppState())
//            } else if (!appState.isLogin) {
//                LoginView()
//                    .environmentObject(AppState())
//            }                // 자동로그인 설정 안 했을 경우
//
            
            ContentView()
        }
    }
}

class AppState: ObservableObject {
    
    @AppStorage("autoLogin") var autoLogin = false
    @AppStorage("isLogin") var isLogin = false
}

