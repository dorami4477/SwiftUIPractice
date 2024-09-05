//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by 박다현 on 9/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var nextButton = true
    
    var body: some View {
        NavigationView {
            VStack{
                Image("launch")
                Image("launchImage")
                NavigationLink {
                    ProfileSettingView()
                } label: {
                    BasicButton(title: "시작하기", active: $nextButton)
                }
            }
            .padding(.horizontal, 20)
        }
        
    }
}

#Preview {
    ContentView()
}

struct BasicButton: View {
    let title: String
    @Binding var active: Bool
    
    var body: some View {
        Text(title)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(active ? .blue : .gray)
            .clipShape(Capsule())
    }
}
