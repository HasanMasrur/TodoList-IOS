//
//  TodoListApp.swift
//  TodoList
//
//  Created by Hasan Masrur on 9/1/25.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{ListView()}
        }.environmentObject(listViewModel)
    }
}
