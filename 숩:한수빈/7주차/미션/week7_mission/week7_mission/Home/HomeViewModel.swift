//
//  HomeViewModel.swift
//  week7_mission
//
//  Created by Subeen on 2023/11/15.
//

import Foundation

class HomeViewModel: ObservableObject {
	@Published var homeContents: [HomeContent]
	
	init(
		homeContents: [HomeContent] = [
			.init(imageFileName: "item1",
						title: "스팸선물세트 팔아요",
						subTitle: "영통구 매탄3동",
						stateFileName: "done",
						price: "12,000원",
						numOfChat: "3",
						numOfHeart: "4"
					 ),
			.init(imageFileName: "item2",
						title: "포켓몬 띠부띠부씰",
						subTitle: "영통구 영통3동",
						stateFileName: "done",
						price: "100원",
						numOfChat: "3",
						numOfHeart: "4"
					 ),
			
			.init(imageFileName: "item4",
						title: "이거 이름 뭐더라",
						subTitle: "영통구 영통1동",
						stateFileName: "done",
						price: "24,000원",
						numOfChat: "3",
						numOfHeart: "4"
					 ),
			.init(imageFileName: "item3",
						title: "장하오 포카 사요",
						subTitle: "영통구 매탄3동",
						stateFileName: "reserved",
						price: "999,999원",
						numOfChat: "99",
						numOfHeart: "123"
					 ),
			.init(imageFileName: "item5",
						title: "호박 사세요 호박호박",
						subTitle: "영통구 매탄3동",
						stateFileName: "",
						price: "7,000원",
						numOfChat: "20",
						numOfHeart: "4"
					 ),
			.init(imageFileName: "item5",
						title: "호박 사세요 호박호박",
						subTitle: "영통구 매탄3동",
						stateFileName: "",
						price: "7,000원",
						numOfChat: "20",
						numOfHeart: "2"
					 ),
			.init(imageFileName: "item3",
						title: "호박 사세요 호박호박",
						subTitle: "영통구 매탄3동",
						stateFileName: "",
						price: "7,000원",
						numOfChat: "20",
						numOfHeart: "1"
					 )
		]
	) {
		self.homeContents = homeContents
	}
}
