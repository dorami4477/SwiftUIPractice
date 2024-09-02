//
//  ProfileImageView.swift
//  SwiftUIPractice
//
//  Created by 박다현 on 9/2/24.
//

import SwiftUI

struct ProfileImageView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let imageName = ["profile_0", "profile_1", "profile_2", "profile_3", "profile_4", "profile_5", "profile_6", "profile_7", "profile_8", "profile_9", "profile_10", "profile_11"]
    
    @State private var selectedImage: String = "profile_0"
    
    var body: some View {
        NavigationView {
            VStack{
                SelectedProfileImage(iamgeName: selectedImage, active: true)
                    .frame(width: 130, height: 130)
                LazyVGrid(columns: columns) {
                     ForEach(imageName, id: \.self) { item in
                         Button {
                             selectedImage = item
                         } label: {
                             SelectedProfileImage(iamgeName: item, active: selectedImage == item)
                                 .frame(width: 110, height: 110)
                                 .opacity(selectedImage == item ? 1 : 0.6)
                         }
                     }
                   }
                Spacer()
            }
            .padding(.horizontal, 20)
                .navigationTitle("PROFILE SETTING")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileImageView()
}
