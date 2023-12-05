//
//  ContentView.swift
//  week9_mission
//
//  Created by Subeen on 2023/11/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 0) {

                    Spacer()
                    
                    // MARK: - 로그인 하러가기
                    NavigationLink(
                        destination: LoginView(),
                        label: {
                            HStack {
                                Spacer()
                                Text("로그인 하러 가기")
                                Spacer()
                            }
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                        }
                    )
                    
                    Spacer()
                        .frame(height: 20)
                    
                    // MARK: - 회원가입 하러가기
                    NavigationLink(
                        destination: RegisterView(),
                        label: {
                            HStack {
                                Spacer()
                                Text("회원가입 하러가기")
                                Spacer()
                            }
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                        }
                    )
                    
                    Spacer()
                        .frame(height: 20)
                    
                    // MARK: - 내 프로필 보러 가기
                    NavigationLink(
                        destination: Text("내 프로필 화면"),
                        label: {
                            HStack {
                                Spacer()
                                Text("내 프로필 보러 가기")
                                Spacer()
                            }
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                        }
                    )
                    
                    Spacer()
                        .frame(height: 20)
                    
                    // MARK: - 사용자 목록 보러 가기
                    NavigationLink(
                        destination: Text("사용자 목록 화면"),
                        label: {
                            HStack {
                                Spacer()
                                Text("사용자 목록 보러 가기")
                                Spacer()
                            }
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                        }
                    )
                    
                    Spacer()
                    
                } //: VSTACK
            } //: NavigationStack
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
