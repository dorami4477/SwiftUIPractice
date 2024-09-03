//
//  SearchView.swift
//  SwiftUIPractice
//
//  Created by 박다현 on 9/3/24.
//

import SwiftUI

struct SearchView: View {
    @State private var search = ""
    @State private var markets: Markets = []
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(markets, id: \.self) { item in
                    rowView(item)
                }
                .searchable(text: $search)
            .navigationTitle("Search")
            }
        }
        .task {
            do {
                markets = try await UpbitAPI.fetchAllMarket()
            } catch {
                
            }
        }
    }
    func rowView(_ item: Market) -> some View {
        HStack {
            Image(systemName: "heart")
                .resizable()
                .background(.yellow)
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(item.koreanName)
                    .bold()
                Text(item.market)
            }
            Spacer()
            Image(systemName: "star")
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 7)
    }
}

#Preview {
    SearchView()
}
