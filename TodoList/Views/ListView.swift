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
            Group {
                if listModelView.items.isEmpty {
                    // Show a message if the list is empty
                    VStack(spacing: 24) {
                        Image(systemName: "tray.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .foregroundColor(.gray.opacity(0.6))
                        Text("No Tasks Available")
                            .font(.title3.weight(.semibold))
                            .foregroundColor(.primary.opacity(0.8))
                        Text("Start by adding new tasks using the 'Add' button below.")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: 300)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    // Display the list of items
                    List {
                        ForEach(listModelView.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    listModelView.updateItem(item: item)
                                }
                                .padding(.vertical, 8) // Better spacing for rows
                        }
                        .onDelete(perform: listModelView.deleteItem)
                        .onMove(perform: listModelView.moveItem)
                    }
                    .listStyle(.insetGrouped) // Use a modern list style
                }
            }
            .navigationTitle("Todo List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .foregroundColor(.blue)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddView()) {
                        Label("Add", systemImage: "plus.circle.fill")
                            .labelStyle(.titleAndIcon)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .accentColor(.blue) // Set the global accent color for the NavigationView
    }
}

#Preview {
    NavigationView {
        ListView()
    }.environmentObject(ListViewModel())
}
