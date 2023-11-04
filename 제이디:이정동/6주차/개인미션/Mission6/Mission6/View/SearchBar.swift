//
//  SearchBar.swift
//  Mission6
//
//  Created by 이정동 on 11/2/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.green)
            TextField("찾는 맛집 이름이 뭐예요?", text: $text)
        }
        .frame(height: 40)
        .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
        .background(Color(.secondarySystemBackground))
        .padding()
    }
}

#Preview {
    SearchBar(text: .constant("test"))
}
