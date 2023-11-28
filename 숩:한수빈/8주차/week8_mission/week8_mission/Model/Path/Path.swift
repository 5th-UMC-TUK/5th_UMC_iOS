//
//  PathModel.swift
//  week8_mission
//
//  Created by Subeen on 2023/11/21.
//

import Foundation

class PathModel: ObservableObject {
	@Published var paths: [PathType]
	
	init(paths: [PathType] = []) {	// 초기화!
		self.paths = paths
	}
}
