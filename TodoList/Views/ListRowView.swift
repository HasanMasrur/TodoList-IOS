//
//  ListRowView.swift
//  TodoList
//
//  Created by Hasan Masrur on 7/1/25.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel

    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(item.isCompleted ? .green : .gray)
            Text(item.title)
               
            Spacer()
        }
        .padding(  1)
    }
}

#Preview {
    Group {
        ListRowView(item: ItemModel(title: "This is an incomplete task", isCompleted: false))
        ListRowView(item: ItemModel(title: "This is a completed task", isCompleted: true))
            
    }
}


