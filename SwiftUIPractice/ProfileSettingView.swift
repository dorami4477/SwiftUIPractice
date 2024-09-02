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
    let pair: Int
}

struct ProfileSettingView: View {

@State private var isSheetPresneted = false
@State private var nickName =  ""
@State private var isButtonActive = false
@State private var  mbtiList = [
    MbtiModel(title: "E", active: false, pair: 0),
    MbtiModel(title: "S", active: false, pair: 1),
    MbtiModel(title: "T", active: false, pair: 2),
    MbtiModel(title: "J", active: false, pair: 3),
    MbtiModel(title: "I", active: false, pair: 0),
    MbtiModel(title: "N", active: false, pair: 1),
    MbtiModel(title: "F", active: false, pair: 2),
    MbtiModel(title: "P", active: false, pair: 3),
]
let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]


    var body: some View {
        NavigationView {
            VStack {
                Button {
                    isSheetPresneted = true
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
            .sheet(isPresented: $isSheetPresneted, content: {
                ProfileImageView()
            })
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
    var active: Bool
    
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
