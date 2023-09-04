//
//  ListDetailsView.swift
//  SwiftUI_AtoZ
//
//  Created by MacBook Pro on 25/7/23.
//

import SwiftUI

struct ListDetailsView: View {
    @StateObject var viewModel: ListVM
    @State var title: String
    var index: Int
    var body: some View {
        VStack {
            TextField("", text: $title)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder()
                    .foregroundColor(.black)
            )
            .onChange(of: title, perform: { newValue in
                viewModel.itemUpdate(index: index, text: title)
            })
            .padding()
        }
        .navigationBarTitle("List Details", displayMode: .inline)
    }
}

struct ListDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailsView(viewModel: ListVM(), title: "Dummy text", index: 0)
    }
}
