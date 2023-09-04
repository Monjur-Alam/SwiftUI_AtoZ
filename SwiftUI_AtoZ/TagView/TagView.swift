//
//  TagView.swift
//  SwiftUI_AtoZ
//
//  Created by MacBook Pro on 24/7/23.
//

import SwiftUI

struct TagView: View {
    @StateObject var viewModel = TagVM()
    
    var body: some View {
        VStack{
            TextField("Enter tag",
                      text: $viewModel.tagText,
                      onCommit: {
                viewModel.addTag()
            })
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder()
                    .foregroundColor(.black)
            )
            Spacer()
                .frame(height: 20)
            
            VStack(alignment: .leading, spacing: 4) {
                ForEach(viewModel.rows, id:\.self){ rows in
                    HStack(spacing: 6){
                        ForEach(rows){ row in
                            Text(row.name)
                                .font(.system(size: 16))
                                .padding(.leading, 14)
                                .padding(.trailing, 30)
                                .padding(.vertical, 8)
                                .background(
                                    ZStack(alignment: .trailing){
                                        Capsule()
                                            .fill(.gray.opacity(0.3))
                                        Button{
                                            viewModel.removeTag(by: row.id)
                                        } label:{
                                            Image(systemName: "xmark.circle")
                                                .frame(width: 15, height: 15)
                                                .padding(.trailing, 8)
                                                .foregroundColor(.red)
                                        }
                                    }
                                )
                        }
                    }
                    .frame(height: 28)
                    .padding(.bottom, 10)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .padding(.horizontal, 20)
        .navigationBarTitle("Tag View", displayMode: .inline)
    }
}



struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView()
    }
}
