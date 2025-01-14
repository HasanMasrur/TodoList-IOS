//
//  itemModel.swift
//  TodoList
//
//  Created by Hasan Masrur on 9/1/25.
//

import Foundation

struct ItemModel:Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
    
}
