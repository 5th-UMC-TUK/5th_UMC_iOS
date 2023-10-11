//
//  Music.swift
//  Mission5
//
//  Created by 이정동 on 10/11/23.
//

import Foundation

struct MusicData: Codable {
    let resultCount: Int
    let results: [Music]
}

struct Music: Codable {
    let songName: String
    let artistName: String
    let albumName: String
    
    enum CodingKeys: String, CodingKey {
        case songName = "trackName"
        case artistName
        case albumName = "collectionName"
    }
}
