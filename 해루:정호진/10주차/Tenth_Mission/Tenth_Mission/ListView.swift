//
//  ListView.swift
//  Tenth_Mission
//
//  Created by 정호진 on 12/4/23.
//

import SwiftUI
import RxSwift

struct ListView: View {
    @ObservedObject var data: Service
    private let disposeBag = DisposeBag()
    
    init() {
        self.data = Service()
        getData()
    }
    
    func getData() {
        guard let apikey = Bundle.main.object(forInfoDictionaryKey: "apiKey") as? String else { return }
        let url = "https://incheon.openapi.redtable.global/api/rstr/korean?serviceKey=\(apikey)"
        data.getList(url: url)
            .subscribe(onNext: { list in
                data.data = list
            })
            .disposed(by: disposeBag)
    }
    
    var body: some View {
        List(data.data ?? []) { data in
            Text(data.rstrNm ?? "")
        }
        
    }
    

}
