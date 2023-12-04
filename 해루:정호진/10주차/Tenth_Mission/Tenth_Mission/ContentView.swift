//
//  ContentView.swift
//  Tenth_Mission
//
//  Created by 정호진 on 12/4/23.
//

import SwiftUI
import KakaoSDKAuth
import KakaoSDKUser

struct ContentView: View {
    @State var path: [String] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            Button(action: {
                if (UserApi.isKakaoTalkLoginAvailable()) {
                    UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                        path.append("yo")
                    }
                } else {
                    UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                        path.append("yo")
                    }
                }
            }) {
                ZStack {
                    Color.yellow
                    Text("Kakao Login")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(height: 70)
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            .onOpenURL(perform: { url in
                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                    _ = AuthController.handleOpenUrl(url: url)
                }
            })
            .navigationDestination(for: String.self) { _ in
                ListView()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
