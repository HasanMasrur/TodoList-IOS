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
            ItemModel(title: "This is the second title", isCompleted: true)
         
      ]
        items.append(contentsOf: newItem)
    }
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    func moveItem(from : IndexSet, to    : Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String) {
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func updateItem(item: ItemModel) {
        if var index =     items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateCompleted()
        }
    }
    
    
}
