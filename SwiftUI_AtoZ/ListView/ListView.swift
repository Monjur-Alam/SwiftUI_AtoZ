//
//  ListView.swift
//  SwiftUI_AtoZ
//
//  Created by MacBook Pro on 25/7/23.
//

import SwiftUI

struct ListView: View {
    @StateObject private var viewModel = ListVM()
    var body: some View {
        VStack {
            List{
                ForEach(0...(viewModel.bookTitles.count-1), id: \.self) { index in
                    NavigationLink(destination: ListDetailsView(viewModel: viewModel,
                                                                title: viewModel.bookTitles[index],
                                                                index: index)) {
                        ListItem(title: viewModel.bookTitles[index])
                    }
                }
            }
            
            Spacer().frame(height: 20)
            
            VStack(spacing: 0) {
                ForEach(0...(viewModel.bookTitles.count-1), id: \.self) { index in
                    NavigationLink(destination: ListDetailsView(viewModel: viewModel,
                                                                title: viewModel.bookTitles[index],
                                                                index: index)) {
                        ListItem(title: viewModel.bookTitles[index])
                    }
                }
                .onDeleteAction {
                    print("Delete successfully.")
                }
            }
        }
        .navigationBarTitle("List View", displayMode: .inline)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

struct ListItem: View {
    var title: String
    var body: some View {
        HStack {
            Text("\(title)")
                .frame(height: 30.0)
            Spacer()
        }
    }
}
