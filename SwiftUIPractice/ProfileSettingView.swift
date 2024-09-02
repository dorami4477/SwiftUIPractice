//
//  ProfileSettingView.swift
//  SwiftUIPractice
//
//  Created by 박다현 on 9/2/24.
//

import SwiftUI

struct MbtiModel: Hashable, Identifiable {
    let id = UUID()
    let title: String
    var active: Bool
}

struct ProfileSettingView: View {

@State private var nickName =  ""
@State private var isButtonActive = false
@State private var  mbtiList = [
    MbtiModel(title: "E", active: false),
    MbtiModel(title: "S", active: false),
    MbtiModel(title: "T", active: false),
    MbtiModel(title: "J", active: false),
    MbtiModel(title: "I", active: false),
    MbtiModel(title: "N", active: false),
    MbtiModel(title: "F", active: false),
    MbtiModel(title: "P", active: false),
]
let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    ProfileImageView()
                } label: {
                    SelectedProfileImage(iamgeName: "profile_0", active: true)
                        .frame(width: 130, height: 130)
                }
                TextField("닉네임을 입력해주세요.:)", text: $nickName)
                Rectangle()
                  .fill(Color(.systemGray4))
                  .frame(height:1)
                HStack(alignment: .top) {
                    Text("MBTI")
                        .bold()
                    Spacer()
                    LazyVGrid(columns: columns) {
                        ForEach($mbtiList, id: \.id) { item in
                             Mbti(data: item)
                         }
                       }
                }
                .padding(.vertical)
                Spacer()
                NavigationLink {
                    StartView()
                } label: {
                    BasicButton(title: "완료", active: $isButtonActive)
                }

            }
            .padding(.horizontal, 20)
                .navigationTitle("PROFILE SETTING")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

#Preview {
    ProfileSettingView()
}

struct SelectedProfileImage: View {
    let iamgeName: String
    let active: Bool
    
    var body: some View {
        Image(iamgeName)
            .resizable()
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(active ? .blue : .gray, lineWidth: active ? 4 : 1)
            }
            .padding()
    }
}


struct Mbti: View {
    @Binding var data: MbtiModel
    
    var body: some View {
        Button(action: {
            print("버튼 클릭\(data.title)")
            data.active.toggle()

        }, label: {
            Text(data.title)
                .foregroundStyle(data.active ? .white : .gray)
                .bold()
                .frame(width: 40, height: 40)
                .background(data.active ? .blue : .clear)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(.gray, lineWidth: data.active ? 0 : 1)
                }
        })
    }
}
