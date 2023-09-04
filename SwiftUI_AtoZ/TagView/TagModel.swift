//
//  TagModel.swift
//  SwiftUI_AtoZ
//
//  Created by MacBook Pro on 24/7/23.
//

import Foundation

struct TagModel: Identifiable, Hashable{
    var id = UUID().uuidString
    var name: String
    var size: CGFloat = 0
}
