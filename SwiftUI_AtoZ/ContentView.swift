//
//  ContentView.swift
//  SwiftUI_AtoZ
//
//  Created by MacBook Pro on 24/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section("Beginner") {
                    NavigationLink(destination: TagView()) {
                        Label("Tag View", systemImage: "tag.fill")
                            .foregroundColor(Color.blue)
                    }
                    NavigationLink(destination: ListView()) {
                        Label("List View", systemImage: "list.bullet")
                            .foregroundColor(Color.blue)
                    }
                    NavigationLink(destination: DatePickerView()) {
                        Label("Date Picker View", systemImage: "calendar")
                            .foregroundColor(Color.blue)
                    }
                    NavigationLink(destination: SimpleTabView()) {
                        Label("Tab View", systemImage: "tablecells.fill")
                            .foregroundColor(Color.blue)
                    }
                    NavigationLink(destination: ImagePickerView()) {
                        Label("Image Picker", systemImage: "photo")
                            .foregroundColor(Color.blue)
                    }
                    NavigationLink(destination: ProgressView(value: 2)) {
                        Label("Progress", systemImage: "photo")
                            .foregroundColor(Color.blue)
                    }
                    NavigationLink(destination: SegmentView()) {
                        Label("Segment", systemImage: "photo")
                            .foregroundColor(Color.blue)
                    }
                }
//                Section("Loop") {
//                    NavigationLink(destination: TagView()) {
//                        Label("ForEach", systemImage: "tag.fill")
//                            .foregroundColor(Color.blue)
//                            .bold()
//                    }
//                    NavigationLink(destination: ListView()) {
//                        Label("For", systemImage: "list.bullet")
//                            .foregroundColor(Color.blue)
//                            .bold()
//                    }
//                }
            }
            .navigationTitle("Dashboard")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
