//
//  HomeView.swift
//  week6_mission
//
//  Created by Subeen on 2023/11/07.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        
        
        NavigationStack {
            ZStack {
                totalView()
                VStack {
                    Spacer()
                    tapBarView()
                        
                }
                .edgesIgnoringSafeArea(.bottom)

            }
            
        }
        
    }
}

@ViewBuilder
private func totalView() -> some View {
    ZStack {
        
        Color.background.ignoresSafeArea(.all)
        
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                searchView()
                VStack(spacing: 13) {
                    topButtonView()
                    deliveryButtonView()
                    menuView()
                    adView()
                    Spacer()
                }
                .padding(10)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.accentColor, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            Image(systemName: "square.grid.2x2")
            Image(systemName: "bell")
            Image(systemName: "cart")
        }
        .foregroundColor(.white)
    }
}


@ViewBuilder
private func searchView() -> some View {
    SearchBarView()
}

@ViewBuilder
private func topButtonView() -> some View {
    Button {
        
    } label: {
        RoundedRectangle(cornerRadius: 10)
            .strokeBorder(
                LinearGradient(gradient: Gradient(colors: [.cyan, .purple, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing),
                lineWidth: 1.5
            )
            .background(RoundedRectangle(cornerRadius: 10).fill(.white))
            .frame(height: 80)
//            .padding(.horizontal, 5)
            .overlay {
                HStack(spacing: 5) {
                    Text("무조건 당첨!")
                        .fontWeight(.bold)
                    Text("오늘 내 쿠폰은?")
                }
            }
            
            .foregroundColor(.black)
    }

}

@ViewBuilder
private func deliveryButtonView() -> some View {
    HStack(spacing: 10) {
        ButtonView(title: "배달", subtitle: "요즘 배민\n맛집은?")
        ButtonView(title: "B마트", subtitle: "최대3만원쿠폰\n5일장 오픈!")
        ButtonView(title: "배민스토어", subtitle: "배달은 지금\n옵니다")
    }
}

@ViewBuilder
private func menuView() -> some View {
    ZStack {
        Color.white
        
        VStack {
            HStack {
                Text("알뜰 한집배달")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("배민1은 365일 할인 중!")
                Spacer()
            }
            .foregroundColor(.black)
            .padding(.leading, 15)

//            .padding(.top, 20)
            
            Grid(horizontalSpacing: 15, verticalSpacing: 10) {
                GridRow {
                    MenuButtonView(name: "족발보쌈")
                    MenuButtonView(name: "돈까스회")
                    MenuButtonView(name: "피자")
                    MenuButtonView(name: "찜찌개")
                    MenuButtonView(name: "중식")
                }
                GridRow {
                    MenuButtonView(name: "치킨")
                    MenuButtonView(name: "버거")
                    MenuButtonView(name: "분식")
                    MenuButtonView(name: "디저트")
                    MenuButtonView(name: "전체보기")
                }
            }
        }
//        .padding(.vertical, 20)
    }
    .cornerRadius(10)
    .frame(height: 250)
//    .padding(.vertical, 5)


}

@ViewBuilder
private func adView() -> some View {
    Image("ads")
        .resizable()
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
