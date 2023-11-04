//
//  Service.swift
//  5thMission
//
//  Created by 정호진 on 10/30/23.
//

import Foundation
import Alamofire
import RxSwift

final class Service {
    
    func getList(url: String) -> Observable<[Body]> {
        
        return Observable.create { observer in
            AF.request(url,
                       method: .get)
            .validate(statusCode: 200..<201)
            .responseDecodable(of: Model.self) { response in
                switch response.result {
                case .success(let data):
                    observer.onNext(data.body ?? [])
                case .failure(let error):
                    print(error)
                }
            }
            return Disposables.create()
        }
        
    }
}
