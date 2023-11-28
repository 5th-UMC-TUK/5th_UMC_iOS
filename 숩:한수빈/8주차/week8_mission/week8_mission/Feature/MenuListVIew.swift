//
//  MenuListVIew.swift
//  week8_mission
//
//  Created by Subeen on 2023/11/21.
//

import SwiftUI

struct MenuListView: View {
	@StateObject private var pathModel: PathModel = PathModel()
	@StateObject private var menuListViewModel: MenuListViewModel = MenuListViewModel()

    var body: some View {
			NavigationStack(path: $pathModel.paths) {
				ZStack {
					ScrollView(.vertical) {
						VStack(spacing: 0) {
						TitleView()
								
						MenuListContentView()
							
						
						countView()
					}
				}
					AddBtnView()
						.edgesIgnoringSafeArea(.bottom)
			}//: ZSTACK
				.edgesIgnoringSafeArea(.top)
				.navigationDestination(for: PathType.self) { pathType in
					switch pathType {
					case .menuView :
						MenuListView()
							.navigationBarBackButtonHidden()
//							.environmentObject(menuListViewModel)
					case .shopView :
						ShopView()
//							.environmentObject(menuListViewModel)
					}
				}
		}
			.environmentObject(pathModel)
			.environmentObject(menuListViewModel)
	}
}

// MARK: - 타이틀 이미지 & 메뉴 소개 뷰
private struct TitleView: View {
	@EnvironmentObject private var menuListViewModel: MenuListViewModel
	
	fileprivate var body: some View {
		VStack(spacing: 0) {
			Rectangle()
				.frame(height: 250)
			Rectangle()
				.fill(.white)
				.frame(height: 180)
				.overlay {
					VStack(alignment: .leading, spacing: 10) {
						HStack {
							Text("인기")
							Text("맥스파이시 상하기버거 세트")
								.font(.system(size: 24, weight: .bold))
						} //: HSTACK
						Text("맥스파이시 상하이버거 + 후렌치후라이(M) + 콜라(M)\n매콤한 시즈닝을 입힌 100% 닭가슴 통살")
							.foregroundColor(.gray)
						ZStack {
							Color.gray
							Text("영양성분 및 알레르기성분 표시 보기")
//								.padding(10)
								.font(.system(size: 13, weight: .light))
						} //: ZSTACK
						.frame(width: 200, height: 20)
						.cornerRadius(10)
		
					} //: VSTACK
				}
			
			HStack {
				Text("가격")

				Spacer()
				
				Text("\(menuListViewModel.price)원")
			} //: HSTACK
			.font(.system(size: 22, weight: .bold))
			.padding(.bottom, 10)
			.padding(.horizontal, 20)
			
			Rectangle()
				.foregroundColor(.gray)
				.frame(height: 10)
		}//: VSTACK
		.edgesIgnoringSafeArea(.top)
	}
}

// MARK: - 메뉴 선택 뷰
private struct MenuListContentView: View {
	@EnvironmentObject private var menuListViewModel: MenuListViewModel
//	@Binding var totalPrice2: Int
	
	fileprivate var body: some View {
		VStack(spacing: 0) {
			HStack {
				Text(menuListViewModel.title)
					.font(.system(size: 23, weight: .bold))
				Spacer()
				RoundedRectangle(cornerRadius: 10)
					.fill(.mint)
					.frame(width: 40, height: 20)
					.overlay {
						Text("필수")
							.foregroundColor(.blue)
							.font(.system(size: 13))
					}
			}//: HSTACK
			.padding(.horizontal, 20)
			.padding(.top, 20)
		}//: VSTACK
		
		VStack(spacing: 0) {
			ForEach(menuListViewModel.menus, id: \.self) { menu in
				// TODO: - Menu 셀 뷰에 menu 넣어서 호출
				MenuCellView(menu: menu)
			}
		}
	}
}

// MARK: - 메뉴 셀 뷰
private struct MenuCellView: View {
	@EnvironmentObject private var menuListViewModel: MenuListViewModel
	@State private var isSelected: Bool
//	@Binding var totalPrice2: Int
	private var menu: Menu

	
	fileprivate init(
		isSelected: Bool = false,
		menu: Menu
//		totalPrice: Int
	) {
		_isSelected = State(initialValue: isSelected)
		self.menu = menu
	}
	
	fileprivate var body: some View {
		HStack(spacing: 0) {
			Button(
				action: {
				menuListViewModel.selectedBoxTapped(menu)
					menuListViewModel.calcTotalPrice(menuListViewModel.menus)
			},
				label: {
					menu.selected ?
					Rectangle().frame(width: 10, height: 10).foregroundColor(.black) :
					Rectangle().frame(width: 10, height: 10).foregroundColor(.red)
			})
			
			Text(menu.name)
				.font(.system(size: 20, weight: .medium))
				.padding(.leading, 10)
			Spacer()
			Text(menu.convertedPrice)
				.font(.system(size: 20, weight: .bold))
			
		}// : HSTACK
		.padding(.horizontal, 20)
		.padding(.vertical, 17)
	}
}

// MARK: - 담기 버튼 뷰
private struct AddBtnView: View {
	@EnvironmentObject private var menuListViewModel: MenuListViewModel
	@EnvironmentObject private var pathModel: PathModel
//	@Binding var totalPrice2: Int
	
//	init(totalPrice: Int) {
//		self.totalPrice = totalPrice
//	}
	
	fileprivate var body: some View {
		VStack(spacing: 0) {
			Spacer()
//				.frame(height: 0)
			Rectangle()
				.foregroundColor(.gray)
				.frame(height: 1)
			ZStack {
				Group {
					Rectangle()
						.foregroundColor(.white)
					.frame(height: 100)
				}
				
				VStack {
					HStack {
						Text("최소주문금액\n3000원")
						Spacer()
						Button(
							action: {
								pathModel.paths.append(.shopView)
						}, label: {
							RoundedRectangle(cornerRadius: 10)
								.fill(.mint)
								.frame(width: 250, height: 60)
								.overlay {
									Text("\(menuListViewModel.totalPrice)원 담기")
										.font(.system(size: 20, weight: .bold))
										.foregroundColor(.white)
								}
					})
					}
					.padding(.horizontal, 20)
					Spacer()
						.frame(height: 20)
				}
			} //:ZSTACK
		}//: VSTACK

	}
}

// MARK: - 갯수 뷰
private struct countView: View {
	@EnvironmentObject private var menuListViewModel: MenuListViewModel
	
	fileprivate var body: some View {
		VStack {
			Rectangle()
				.fill(.gray)
				.frame(height: 10)
			HStack {
				Text("수량")
					.font(.system(size: 23, weight: .bold))
				Spacer()
				RoundedRectangle(cornerRadius: 3)
					.stroke(lineWidth: 1)
					.fill(.gray)
					.frame(width: 180, height: 50)
					.overlay {
						HStack(spacing: 40) {
							Button(
								action: {
									menuListViewModel.count -= 1
									menuListViewModel.calcTotalPrice(menuListViewModel.menus)
							}, label: {
								Text("-")
									.font(.system(size: 30, weight: .medium))
							})
							
							Text("\(menuListViewModel.count)개")
							
							Button(
								action: {
									menuListViewModel.count += 1
									menuListViewModel.calcTotalPrice(menuListViewModel.menus)
							}, label: {
								Text("+")
									.font(.system(size: 30, weight: .medium))
							})
						}
						.foregroundColor(.black)
					}
			}
			.padding(.horizontal, 20)
			Rectangle()
				.fill(.white)
				.frame(height: 150)
				
		}
	}
}


struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
				.environmentObject(MenuListViewModel())
				.environmentObject(PathModel())
    }
}
