//
//  LoginView.swift
//  week9_mission
//
//  Created by Subeen on 2023/11/28.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var appState: AppState
    
    @State var emailInput: String = ""
    @State var passwordInput: String = ""
    @State var autoLoginInput: Bool = false
    @State var state: String = "로그인 😇🔫"
    
    @AppStorage("autoLogin") var autoLogin = false
    @AppStorage("email") var email = ""
    @AppStorage("password") var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        Text(state)
                    }
                    
                    Section(
                        header: Text("로그인 정보"),
                        content: {
                        TextField("이메일", text: $emailInput)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .onAppear {
                                    UITextField.appearance().clearButtonMode = .whileEditing
                                } // clear Button 구현
                        SecureField("비밀번호", text: $passwordInput)
                                .keyboardType(.default)
                                .onAppear {
                                    UITextField.appearance().clearButtonMode = .whileEditing
                                } // clear Button 구현
                            
                        Toggle(
                            isOn: $autoLoginInput,
                            label: {
                                Text("자동로그인")
                            })
                        }
                    )
                    
                    
                    Section {
                        Button(
                            action: {
                                print("회원가입 버튼 클릭")
                                email = emailInput
                                password = passwordInput
                                state = "회원가입 성공!"
                            },
                            label: {
                                Text("회원가입 하기")
                            }
                                
                        )
                        .disabled(isButtonValid())  // 빈 칸 있으면 버튼 비활성화
                        
//                        Button(
//                            action: {
//                                NavigationLink("로그인") {
//                                    if (email == emailInput) && (password == passwordInput) {
//
//                                        ProfileView()
//                                    }
//
//                                }
//
//                            },
//                            label: {
//                                Text("login")
//                            }
//                        )
                        
                        
                        
                        
                        
                        
                        NavigationLink(
                            destination: {
                                if (email == emailInput) && (password == passwordInput) {
                                    ProfileView()
                                } else {

                                }
                            },
                            label: {
                                Button(
                                    action: {
                                        print("로그인 버튼 클릭")

                                        if email == "" {    // 가입 정보가 없을 경우
                                            state = "가입된 정보가 없습니다."
                                        } else {
                                            if (email == emailInput) && (password == passwordInput) {
                                                state = "로그인 성공"
                                                appState.isLogin = true
                                                appState.autoLogin = autoLoginInput
                                            }
                                        }
                                    },
                                    label: {
                                        Text("로그인 하기")
                                    }
                                )
                                
                            }
                        )
    
                    }
                }
            }
            .navigationTitle("로그인")
        }
    }
    
    func isButtonValid() -> Bool {
        return emailInput.isEmpty || passwordInput.isEmpty
    }
    
    func isSame() -> Bool {
        return emailInput == email && passwordInput == password
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
