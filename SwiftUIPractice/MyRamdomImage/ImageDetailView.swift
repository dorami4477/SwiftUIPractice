//
//  ImageDetailView.swift
//  SwiftUIPractice
//
//  Created by 박다현 on 9/5/24.
//

import SwiftUI

struct ImageDetailView: View {
    @State var title: String
    let imageURL: URL?
    
    let closure: (String) -> Void
    
    var body: some View {
        VStack{
            AsyncImage(url: imageURL) { data in
                switch data {
                case .empty:
                    ProgressView()
                        .frame(width: 150, height: 200)
                        .padding(.bottom, 10)
                    
                case .success(let image):
                    image
                        .scaledToFit()
                        .frame(width: 150, height: 200)
                        .padding(.bottom, 10)
                    
                case .failure:
                    Image(systemName: "star")
                        .frame(width: 150, height: 200)
                        .padding(.bottom, 10)
                    
                @unknown default:
                    Image(systemName: "star")
                        .frame(width: 150, height: 200)
                        .padding(.bottom, 10) 
                }
            }
            
            TextField("섹션 타이틀", text: $title)
                .padding()
        }
        .onDisappear {
            closure(title)
        }
    }
}

//#Preview {
//    ImageDetailView(title: )
//}
