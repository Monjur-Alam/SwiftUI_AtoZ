//
//  ListVM.swift
//  SwiftUI_AtoZ
//
//  Created by MacBook Pro on 25/7/23.
//

import Foundation

class ListVM: ObservableObject {
    @Published var bookTitles = [
            "Book 1",
            "Book 2",
            "Book 3"
        ]
    
    func itemUpdate(index: Int, text: String) {
        bookTitles[index] = text
    }
}
