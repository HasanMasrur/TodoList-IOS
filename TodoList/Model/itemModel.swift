//
//  itemModel.swift
//  TodoList
//
//  Created by Hasan Masrur on 9/1/25.
//

import Foundation

struct ItemModel:Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id:String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompleted() -> ItemModel {
        ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
