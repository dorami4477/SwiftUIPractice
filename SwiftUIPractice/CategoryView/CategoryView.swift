//
//  CategoryView.swift
//  SwiftUIPractice
//
//  Created by 박다현 on 9/6/24.
//

import SwiftUI

struct Genre: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let count: Int
}

struct CategoryView: View {
    @State private var searchText = ""
    @State private var genre = [
        Genre(name: "스릴러", count: 3),
        Genre(name: "액션", count: 44),
        Genre(name: "SF", count: 51),
        Genre(name: "로멘스", count: 57),
        Genre(name: "애니메이션", count: 9)
    ]
    
    let item = [
        "스릴러",
        "액션",
        "SF",
        "로멘스",
        "애니메이션"
    ]
    
    var filtered: [Genre] {
        return searchText.isEmpty ? genre : genre.filter{ $0.name.contains(searchText) }
    }
    
    var body: some View {
        NavigationView{
            List{
                ForEach(filtered, id: \.id) {item in
                    Text("\(item.name)(\(item.count))")
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("영화검색")
            .toolbar {
                Button {
                    genre.append(Genre(name: item.randomElement() ?? "스릴러", count: Int.random(in: 1...100)))
                } label: {
                    Text("추가")
                }
            }
        }
    }
}

#Preview {
    CategoryView()
}



