//
//  MusicService.swift
//  Mission5
//
//  Created by 이정동 on 10/11/23.
//

import Foundation

class MusicService {
    static let shared = MusicService()
    private init () {}
    
    func requestMusicData(_ searchTerm: String, completion: @escaping (MusicData)->()) {
        let url = URL(string: "https://itunes.apple.com/search?media=music&term=\(searchTerm)")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        // URL Session 생성 (서버랑 통신하는 객체 ~= 브라우저)
        // dataTask -> 비동기적으로 처리됨
        URLSession.shared.dataTask(with: request) { data, response, error in
            // error 발생 시 리턴
            if error != nil {
                print(error!)
                return
            }
            
            // 응답코드에 따른 처리
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~=
                    response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            
            // 데이터가 존재하면 출력
            if let safeData = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(MusicData.self, from: safeData)
                    completion(decodedData)
                } catch {
                    print("Error")
                }
            }
        }.resume()
    }
}
