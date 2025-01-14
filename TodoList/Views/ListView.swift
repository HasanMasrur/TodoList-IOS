//
//  ListView.swift
//  TodoList
//
//  Created by Hasan Masrur on 5/1/25.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listModelView: ListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if listModelView.items.isEmpty {
                    // Show a message if the list is empty
                    VStack(spacing: 16) {
                        Image(systemName: "tray.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                        Text("No tasks available")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text("Start by adding new tasks using the 'Add' button.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                } else {
                    List {
                        ForEach(listModelView.items) { item in
                            ListRowView(item: item).onTapGesture {
                                listModelView.updateItem(item: item)
                            }
                                .listRowSeparator(.hidden) // Hide separator for a cleaner look
                                .padding(.vertical, 1) // Add vertical padding for better spacing
                        }
                        .onDelete(perform: listModelView.deleteItem)
                        .onMove(perform: listModelView.moveItem)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Todo List")
            .navigationBarItems(
                leading: EditButton().foregroundColor(.blue),
                trailing: NavigationLink(
                    destination: AddView(),
                    label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                            Text("Add")
                        }
                    }
                )
            )
        }
        .accentColor(.blue) // Set the global accent color for NavigationView
    }
}

#Preview {
    NavigationView {
        ListView()
    }.environmentObject(ListViewModel())
}
