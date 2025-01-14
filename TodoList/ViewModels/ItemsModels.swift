//
//  ItemsModels.swift
//  TodoList
//
//  Created by Hasan Masrur on 14/1/25.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getitems()
       
    }
    func   getitems() {
         let newItem = [
            ItemModel(title: "This is the first title", isCompleted: false),
            ItemModel(title: "This is the second title", isCompleted: true),
            ItemModel(title: "This is the third title", isCompleted: false),
            ItemModel(title: "This is the fourth title", isCompleted: false),
            ItemModel(title: "This is the fifth title", isCompleted: false),
            ItemModel(title: "This is the sixth title", isCompleted: true),
            ItemModel(title: "This is the seventh title", isCompleted: false),
            ItemModel(title: "This is the eighth title", isCompleted: false),
         
      ]
        items.append(contentsOf: newItem)
    }
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    func moveItem(from : IndexSet, to    : Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    
}