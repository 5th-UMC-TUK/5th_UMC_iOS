//
//  ProfileView.swift
//  week9_mission
//
//  Created by Subeen on 2023/11/29.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var appState: AppState
    
//    @State var userData
    @State var emailInput: String = ""
    @State var passwordInput: String = ""
    @AppStorage("email") var email = ""
    @AppStorage("password") var password = ""
    
    var body: some View {
        VStack {
            Form {
                Section(
                    header: Text("로그인 정보"),
                    content: {
                    Text(email)
                    Text(password)
                    }

                )
                
                Section {
                    Button(
                        action: {
                            print("로그아웃 버튼 클릭")
                            appState.isLogin = false
                        },
                        label: {
                            Text("로그아웃 하기")
                            
                        }
                    )
                }
            }
        }
        .navigationTitle("로그인 하기")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
