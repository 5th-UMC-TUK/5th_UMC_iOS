//
//  ContentView.swift
//  Nineth_Mission
//
//  Created by 정호진 on 11/27/23.
//

import SwiftUI

struct ContentView: View {
    @State var id: String = ""
    @State var pw: String = ""
    @State var check: Bool = false
    @State var result: String = "HI"
    @State var isPresent: Bool = false
    
    var body: some View {
        NavigationStack {
            
            Text(result)
                .font(.title)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0))
            
            TextField("Id를 입력하세요", text: $id)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .textFieldStyle(.roundedBorder)
            
            TextField("비밀번호를 입력하세요", text: $pw)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .textFieldStyle(.roundedBorder)
            
            
            Button(action: {
                if let id = UserDefaults.standard.string(forKey: Login.Id.rawValue),
                   let pw = UserDefaults.standard.string(forKey: Login.Pw.rawValue) {
                    if self.id == id && self.pw == pw {
                        result = "성공"
                        isPresent = true
                    } else {
                        result = "실패"
                    }
                } else {
                    result = "회원이 아님"
                }
                
            }) {
                ZStack {
                    Color.blue
                    Text("Login")
                        .foregroundStyle(.white)
                }
                .frame(height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }
            .sheet(isPresented: $isPresent){
                SuccessView()
            }
            
            
            Button(action: {
                if let id = UserDefaults.standard.string(forKey: Login.Id.rawValue),
                   let pw = UserDefaults.standard.string(forKey: Login.Pw.rawValue) {
                    
                    if id == self.id && pw == self.pw {
                        result = "이미 회원임"
                    } else {
                        UserDefaults.standard.setValue(self.id, forKey: Login.Id.rawValue)
                        UserDefaults.standard.setValue(self.pw, forKey: Login.Pw.rawValue)
                        result = "회원가입 성공"
                    }
                } else {
                    UserDefaults.standard.setValue(id, forKey: Login.Id.rawValue)
                    UserDefaults.standard.setValue(pw, forKey: Login.Pw.rawValue)
                    result = "회원가입 성공"
                }
                
            }) {
                ZStack {
                    Color.blue
                    Text("SignUp")
                        .foregroundStyle(.white)
                }
                .frame(height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }
         
            
            Button(action: {
                check = !check
                UserDefaults.standard.setValue(check, forKey: Login.check.rawValue)
            }) {
                HStack {
                    if check {
                        Image(systemName: "square.fill")
                            .foregroundStyle(.black)
                    } else {
                        Image(systemName: "square")
                            .foregroundStyle(.black)
                    }
                    
                    Text("자동 로그인")
                        .foregroundStyle(.black)
                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            }
            
        }
    }
}

#Preview {
    ContentView()
}

