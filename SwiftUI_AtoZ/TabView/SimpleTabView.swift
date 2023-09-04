//
//  TabBarView.swift
//  SwiftUI_AtoZ
//
//  Created by MacBook Pro on 26/7/23.
//

import SwiftUI

struct SimpleTabView: View {
    @State private var defaultView: Int = 2
    var body: some View {
        TabView(selection: $defaultView) {
            Home()
                .tabItem {
                    Text("Home")
                    Image(systemName: "house")
                }.tag(0)
            Search()
                .tabItem {
                    Text("Search")
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            Play()
                .tabItem {
                    Text("Play")
                    Image(systemName: "play")
                }.tag(2)
            Note()
                .tabItem {
                    Text("Note")
                    Image(systemName: "pencil")
                }.tag(3)
            Message()
                .tabItem {
                    Text("Message")
                    Image(systemName: "message")
                }.tag(4)
            Message()
                .tabItem {
                    Text("Message 1")
                    Image(systemName: "message")
                }.tag(5)
            Message()
                .tabItem {
                    Text("Message 2")
                    Image(systemName: "message")
                }.tag(6)
            Message()
                .tabItem {
                    Text("Message 3")
                    Image(systemName: "message")
                }.tag(7)
        }.accentColor(.brown)
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleTabView()
    }
}

struct Home: View {
    var body: some View {
        Text("Home")
    }
}

struct Search: View {
    var body: some View {
        Text("Search")
    }
}

struct Play: View {
    var body: some View {
        Text("Play")
    }
}

struct Note: View {
    var body: some View {
        Text("Note")
    }
}

struct Message: View {
    var body: some View {
        Text("Message")
    }
}
