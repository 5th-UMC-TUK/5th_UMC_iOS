//
//  Nineth_MissionApp.swift
//  Nineth_Mission
//
//  Created by 정호진 on 11/27/23.
//

import SwiftUI

@main
struct Nineth_MissionApp: App {
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: Login.check.rawValue) {
                SuccessView()
            } else {
                ContentView()
            }
        }
    }
}
