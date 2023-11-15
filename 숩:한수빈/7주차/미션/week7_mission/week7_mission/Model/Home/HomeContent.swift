//
//  HomeContent.swift
//  week7_mission
//
//  Created by Subeen on 2023/11/15.
//

import Foundation

struct HomeContent: Hashable {
	var imageFileName: String
	var title: String
	var subTitle: String
	var stateFileName: String
	var price: String
	var numOfChat: String
	var numOfHeart: String
	
	init (
		imageFileName: String,
		title: String,
		subTitle: String,
		stateFileName: String,
		price: String,
		numOfChat: String,
		numOfHeart: String
	) {
		self.imageFileName = imageFileName
		self.title = title
		self.subTitle = subTitle
		self.stateFileName = stateFileName
		self.price = price
		self.numOfChat = numOfChat
		self.numOfHeart = numOfHeart
	}
}
