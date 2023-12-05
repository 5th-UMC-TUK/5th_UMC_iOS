//
//  RegisterView.swift
//  week9_mission
//
//  Created by Subeen on 2023/11/29.
//

import SwiftUI

struct RegisterView: View {
    
    @State var nameInput: String = ""
    @State var emailInput: String = ""
    @State var passwordInput: String = ""
    
    var body: some View {
        VStack {
            Form {
                // 이름
                Section(
                    header: Text("이름"),
                    content: {
                    TextField("이름", text: $nameInput)
                            .textInputAutocapitalization(.none)
                    }
                )
                
                // 이메일
                Section(
                    header: Text("이메일"),
                    content: {
                    TextField("이메일", text: $emailInput)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.none)
                    }
                )
                
                // 비밀번호
                Section(
                    header: Text("로그인 정보"),
                    content: {
                    SecureField("비밀번호", text: $passwordInput)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.none)
                    SecureField("비밀번호 확인", text: $passwordInput)
                            .keyboardType(.default)
                    }

                )
                
                Section {
                    Button(
                        action: {
                            print("회원가입 버튼 클릭")
                        },
                        label: {
                            Text("회원가입 하기")
                        }
                    )
                }
            }
        }
        .navigationTitle("회원가입 하기")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
