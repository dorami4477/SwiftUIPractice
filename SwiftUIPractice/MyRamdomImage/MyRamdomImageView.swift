//
//  MyRamdomImageView.swift
//  SwiftUIPractice
//
//  Created by 박다현 on 9/5/24.
//

import SwiftUI

struct MyRamdomImageView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0..<5) { item in
                    horizontalImages("\(item + 1) 섹션")
                }
            }
            .navigationTitle("My Ramdom Image")
        }
    }
    
    func horizontalImages(_ title: String) -> some View {
        VStack{
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(0..<7) { item in
                        NavigationLink {
                            ImageDetailView()
                        } label: {
                            PosterView()
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
