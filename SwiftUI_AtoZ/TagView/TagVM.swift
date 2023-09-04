//
//  TagVM.swift
//  SwiftUI_AtoZ
//
//  Created by MacBook Pro on 24/7/23.
//

import UIKit

class TagVM: ObservableObject{
    
    @Published var rows: [[TagModel]] = []
    @Published var tags: [TagModel] = [TagModel(name: "XCode"), TagModel(name: "IOS"), TagModel(name: "IOS App Development"), TagModel(name: "Swift"), TagModel(name: "SwiftUI")]
    @Published var tagText = ""
    
    init(){
        getTags()
    }
    
    func addTag(){
        tags.append(TagModel(name: tagText))
        tagText = ""
        getTags()
    }
    
    func removeTag(by id: String){
        tags = tags.filter{ $0.id != id }
        getTags()
    }
    
    
    func getTags(){
        var rows: [[TagModel]] = []
        var currentRow: [TagModel] = []
        
        var totalWidth: CGFloat = 0
        
        let screenWidth = UIScreen.screenWidth - 10
        let tagSpaceing: CGFloat = 56
        
        if !tags.isEmpty{
            
            for index in 0..<tags.count{
                self.tags[index].size = tags[index].name.getSize()
            }
            
            tags.forEach{ tag in
                
                totalWidth += (tag.size + tagSpaceing)
                
                if totalWidth > screenWidth{
                    totalWidth = (tag.size + tagSpaceing)
                    rows.append(currentRow)
                    currentRow.removeAll()
                    currentRow.append(tag)
                }else{
                    currentRow.append(tag)
                }
            }
            
            if !currentRow.isEmpty{
                rows.append(currentRow)
                currentRow.removeAll()
            }
            
            self.rows = rows
        }else{
            self.rows = []
        }
        
    }
}
