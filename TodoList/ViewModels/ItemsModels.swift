//
//  ItemsModels.swift
//  TodoList
//
//  Created by Hasan Masrur on 14/1/25.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    private let saveItemsKey: String = "save_items"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(title: "This is the first title", isCompleted: false),
//            ItemModel(title: "This is the second title", isCompleted: true)
//        ]
//        items.append(contentsOf: newItems)
        
        guard let encodedData = UserDefaults.standard.data(forKey: saveItemsKey),
            let    items = try? JSONDecoder().decode([ItemModel].self, from: encodedData)
        else { return }
        self.items = items
    }
    
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
    
    func addItem(title: String) {
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompleted()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: saveItemsKey)
        }
    }
}
