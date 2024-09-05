//
//  MyRamdomImageView.swift
//  SwiftUIPractice
//
//  Created by 박다현 on 9/5/24.
//

import SwiftUI

struct MyRamdomImageView: View {
    @State private var sectionList = [
        "첫번째 섹션",
        "두번째 섹션",
        "세번째 섹션",
        "네번째 섹션"
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach($sectionList, id: \.self) { $item in
                    horizontalImages($item)
                }
            }
            .navigationTitle("My Ramdom Image")
        }
    }
    
    func horizontalImages(_ title: Binding<String>) -> some View {
        VStack{
            Text(title.wrappedValue)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(0..<7) { item in
                        let url = URL(string: "https://picsum.photos/200/300")
                        
                        NavigationLink {
                            ImageDetailView(title: title.wrappedValue, imageURL: url) { newTitle in
                                title.wrappedValue = newTitle
                            }
                        } label: {
                            PosterView(url: url)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                        }
                    }
                }
            }
        }
        .padding(.leading)
        .padding(.vertical)
    }
}

#Preview {
    MyRamdomImageView()
}
