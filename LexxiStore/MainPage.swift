//
//  SwiftUIView.swift
//  LexxiStore
//
//  Created by Yerasyl on 02.05.2024.
//

import SwiftUI

struct MainPage: View {
    @State var selectedTab = 0
//    init() {
//        UITabBar.appearance().backgroundColor = UIColor(named: "MyColor")
//    }
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    if selectedTab == 0 {
                        Label("Main", systemImage: "house")
                    } else {
                        Label("Main", image: "house")
                    }
                }.tag(0)
            FavouritesView()
                .tabItem {
                    if selectedTab == 1 {
                        Label("Избранное", systemImage: "heart")
                    } else {
                        Label("Избранное", systemImage: "heart.fill")
                    }
                }
            AddView()
                .tabItem {
                    if selectedTab == 2 {
                        Label("Подать", systemImage: "plus.app")
                    } else {
                        Label("Подать", systemImage: "plus.app")
                    }
                }
            MessageView()
                .tabItem {
                    if selectedTab == 3 {
                        Label("Сообщение", systemImage: "message")
                    } else {
                        Label("Сообщение", systemImage: "message")
                    }
                }
            ProfileView()
                .tabItem {
                    if selectedTab == 3 {
                        Label("Профиль", systemImage: "person.crop.circle")
                    } else {
                        Label("Профиль", systemImage: "person.crop.circle")
                    }
                }
        }
        .padding()
            
    }
}

#Preview {
    MainPage()
}
