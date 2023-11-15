//
//  HomeView.swift
//  week7_mission
//
//  Created by Subeen on 2023/11/15.
//

import SwiftUI

struct HomeView: View {
	@StateObject private var homeViewModel = HomeViewModel()
	
    var body: some View {
			ZStack {
				VStack {
					Spacer()
						.frame(height: 50)
					HomeContentView(homeViewModel: homeViewModel)
				}
				VStack {
					NavigationBar()
					Spacer()
					HStack {
						Spacer()
							.frame(width: 270)
						FloatingButton()
					}
					Spacer()
						.frame(height: 60)
				}
			}
    }
}

private struct HomeContentView: View {
	@ObservedObject private var homeViewModel: HomeViewModel
	
	fileprivate init(homeViewModel: HomeViewModel) {
		// init이 왜 fileprivate인가? 선언시에 파일 내에서 사용하기 위해.
		// private로 하면 온보딩 때 사용 불가능 하기 때문. -> 인강에서 본 건데... 사실 이해 제대로 못 함
		self.homeViewModel = homeViewModel
	}
	
	fileprivate var body: some View {
		HomeCellListView(homeViewModel: homeViewModel)
	}
}


// MARK: - 홈 셀 리스트 뷰
private struct HomeCellListView: View {
	@ObservedObject private var homeViewModel = HomeViewModel()
	init(
		homeViewModel: HomeViewModel
	) {
		self.homeViewModel = homeViewModel
	}
	
	fileprivate var body: some View {
		TabView {
			Group {
				ScrollView {
					// 스크롤뷰 안에는 뷰 하나만!
					VStack(spacing: 0) {
						ForEach(Array(homeViewModel.homeContents.enumerated()), id: \.element) { index, homeContent in
							HomeCellView(homeContent: homeContent)
							
						}
					}
				}
				.tabItem {
					Label("홈", systemImage: "house")
				}
				
				
				Text("동네생활")
					.tabItem {
						Label("동네생활", systemImage: "building.2")
					}
				
				Text("내 근처")
					.tabItem {
						Label("내 근처", systemImage: "checkmark")
					}
				
				Text("채팅")
					.tabItem {
						Label("채팅", systemImage: "message")
					}
					.badge(10)
				
				Text("나의 당근")
					.tabItem {
						Label("나의 당근", systemImage: "person")
					}
		
			}
	
				
				.toolbarBackground(.white, for: .tabBar)
				
		}
	}
}


// MARK: - 홈 셀 뷰
private struct HomeCellView: View {
	private var homeContent: HomeContent
	
	fileprivate init(homeContent: HomeContent) {
		self.homeContent = homeContent
	}
	
	fileprivate var body: some View {
		VStack(spacing: 0) {
			HStack(spacing: 10) {
				Image(homeContent.imageFileName)	// 게시글 사진
					.resizable()
					.frame(width: 100, height: 100)
					.cornerRadius(5)
					.padding(.leading, 15)
				
				
				VStack(alignment: .leading, spacing: 3) {
					HStack() {
						Text(homeContent.title)	// 게시글 제목
							.font(.body)
							.padding(.top, 10)
						Spacer()
						Image(systemName: "ellipsis")
							.rotationEffect(.degrees(90))
							.padding(.top, 20)
					}
					
					Text(homeContent.subTitle)	// 장소
						.font(.caption)
						.foregroundColor(.gray)
					
					HStack(spacing: 3) {
						if homeContent.stateFileName != "" {	// 빈칸 / 거래완료 / 예약중
							Image(homeContent.stateFileName)
								.resizable()
								.scaledToFit()
								.frame(height: 20)
						}

						Text(homeContent.price)		// 가격
							.font(.body)
							.fontWeight(.bold)
					}
					
					Spacer()
					
					HStack(spacing: 3) {	// 채팅 수, 좋아요 수
						Spacer()
						Image(systemName: "message")
						Text(homeContent.numOfChat)
						Image(systemName: "heart")
						Text(homeContent.numOfHeart)
					}
					.foregroundColor(.gray)
				}

				
				Spacer()
				
			}
			.frame(height: 120)
			.padding(.vertical, 10)
			
			Rectangle()							// 구분선
				.fill(.gray)
				.opacity(0.3)
				.frame(height: 1)
				.padding(.horizontal, 10)
		}
	}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
