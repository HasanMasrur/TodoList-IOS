//
//  ListView.swift
//  TodoList
//
//  Created by Hasan Masrur on 5/1/25.
//

import SwiftUI

struct ListView: View {
    @State var items: [String] = [
        "This is the first title",
        "This is the second title",
        "This is the third title",
        "This is the fourth title",
        "This is the fifth title",
        "This is the sixth title",
        "This is the seventh title",
        "This is the eighth title",
        "This is the ninth title",
        "This is the tenth title"
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    ListRowView(title: item)
                }
            }.listStyle(PlainListStyle())
            .navigationTitle("Todo List ")
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink("Add", destination: AddView())
            )
        }
    }
}



#Preview {
    NavigationView {
        ListView()
    }
}
