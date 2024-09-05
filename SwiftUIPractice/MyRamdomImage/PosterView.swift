//
//  PosterView.swift
//  SwiftUIPractice
//
//  Created by 박다현 on 9/5/24.
//

import SwiftUI

struct PosterView: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { data in
            switch data {
            case .empty:
                ProgressView()
                    .frame(width: 150, height: 200)
                
            case .success(let image):
                image
                    .scaledToFit()
                    .frame(width: 150, height: 200)
                
            case .failure:
                Image(systemName: "star")
                    .frame(width: 150, height: 200)
                
            @unknown default:
                Image(systemName: "star")
                    .frame(width: 150, height: 200)
            }
        }
    }
}

#Preview {
    PosterView(url: URL(string: "https://picsum.photos/200/300"))
}
